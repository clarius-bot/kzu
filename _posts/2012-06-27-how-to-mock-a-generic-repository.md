---
layout: post
title: "Daniel Cazzulino's Blog - How to mock a generic repository"
date: 2012-06-27 00:00:00 +0000
---

##  [How to mock a generic repository](<http://blogs.clariusconsulting.net/kzu/how-to-mock-a-generic-repository/> "How to mock a generic repository")

June 27, 2012 2:17 pm

The short answer is: you don’t. You see, having a mocking library at hand (no matter [how cool it is](<https://bit.ly/Qjt280>)) doesn’t automatically make it the best tool for every testing need. 

A generic repository is much easier to replace for testing with a simple fake and allows to use simple state-based testing agaist it, rather than mock verifications. 

A fairly typical generic repository might look like the following:
    
    
    public interface IRepository<T> where T : IEntity
    {
        T Get(Guid id);
        void SaveOrUpdate(T entity);
        void Delete(T entity);
        IQueryable<T> Query();
    }

You might use integer or long for IDs, you might not have an IEntity interface but a base class, you might not have a Query feature there, but that’s beside the point. The point is that such an interface, whatever the variations, is trivial to fake:
    
    
    public class FakeRepository<T> : IRepository<T>
         where T : IEntity
    {
        private Dictionary<Guid, T> data = new Dictionary<Guid, T>();
    
        public T Get(Guid id)
        {
            var entity = default(T);
            data.TryGetValue(id, out entity);
            return entity;
        }
    
        public void SaveOrUpdate(T entity)
        {
            data[entity.Id] = entity;
        }
    
        public void Delete(T entity)
        {
            data.Remove(entity.Id);
        }
    
        public IQueryable<T> Query()
        {
            return data.Values.AsQueryable();
        }
    }

DONE. So why go for a mock, multiple setups, etc.? No need at all. This is a simple reusable fake that you can leverage over and over again in all tests. 

What if you have more of a [domain context-like repository](<https://bit.ly/Qjs77r>) that is more like a unit of work + entity collections? Something like:
    
    
    public interface IDomainContext
    {
        void Commit();
    
        T Find<T>(Guid id) where T : IEntity;
    
        void Save<T>(T entity) where T : IEntity;
    
        void Delete<T>(Guid id) where T : IEntity;
    
        IQueryable<Product> Products { get; }
        // Other entities
    }

That’s also trivial to fake:
    
    
    public class FakeDomainContext : IDomainContext
    {
        private List<object> data = new List<object>();
    
        public void Commit()
        {
            throw new NotImplementedException();
        }
    
        public T Find<T>(Guid id) where T : IEntity
        {
            return data.OfType<T>().FirstOrDefault(x => x.Id == id);
        }
    
        public void Save<T>(T entity) where T : IEntity
        {
            var existing = data.OfType<T>().FirstOrDefault(x => x.Id == entity.Id);
            if (existing != null)
                data.Remove(existing);
    
            data.Add(entity);
        }
    
        public void Delete<T>(Guid id) where T : IEntity
        {
            data.RemoveAll(x => x is T && ((T)x).Id == id);
        }
    
        public IQueryable<Product> Products { get { return data.OfType<Product>().AsQueryable(); } }
    }

Any other variations of the repository pattern or similar persistence abstraction you have, can simply be replaced with an in-memory one based on lists or dictionaries. Just don’t try to mock something that simple to fake.

/kzu
