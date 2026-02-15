---
layout: post
title: Automatic component registrations in Autofac
date: 2013-06-05 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/automatic-component-registrations-in-autofac
tags:
- .NET

---


I just had to adapt my favorite IoC container to do some of the things MEF does out of the box, namely registering all classes that have a certain attribute (in MEF’s case, [Export]). 

This is very easy with Autofac. I first created the attribute that would mark my “components” for registration (aka “exports”):
    
    
    /// <summary>
    /// Marks the decorated class as a component that will be available from
    /// the service locator / component container.
    /// </summary>
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false)]
    public class ComponentAttribute : Attribute
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ComponentAttribute"/> class,
        /// marking the decorated class as a component that will be available from
        /// the service locator / component container, registered with all
        /// implemented interfaces as well as the concrete type.
        /// </summary>
        public ComponentAttribute()
        {
        }
    
        /// <summary>
        /// Initializes a new instance of the <see cref="ComponentAttribute"/> class,
        /// marking the decorated class as a component that will be available from
        /// the service locator / component container using the specified
        /// <paramref name="registerAs"/> type.
        /// </summary>
        /// <param name="registerAs">The type to use to register the decorated component.</param>
        public ComponentAttribute(Type registerAs)
        {
            this.RegisterAs = registerAs;
        }
    
        /// <summary>
        /// Type to use for the component registration.
        /// </summary>
        public Type RegisterAs { get; private set; }
    }

The next step is to provide an idiomatic way to register components that have this attribute (let’s call them just that, components) with a container builder. Autofac leverages extension methods extensively, and it already provides a couple that perform this sort of scanning for registration: RegisterAssemblyTypes and RegisterTypes. Both are similar and return a builder fluent interface that can be used to further tweak the registrations:
    
    
    builder.RegisterAssemblyTypes(Assembly.GetExecutingAssembly())
        .OnActivated(...)
        .Named(....)
        ...

Ideally, we should provide similar functionality for our components. We can simply leverage the built-in methods in Autofac and provide the following extension methods:
    
    
    /// <summary>
    /// Provides automatic component registration by scanning assemblies and types for
    /// those that have the <see cref="ComponentAttribute"/> annotation.
    /// </summary>
    public static class CompositionExtensions
    {
        /// <summary>
        /// Registers the components found in the given assemblies.
        /// </summary>
        public static IRegistrationBuilder<object, ScanningActivatorData, DynamicRegistrationStyle> RegisterAssemblyComponents(this ContainerBuilder builder, params Assembly[] assemblies)
        {
            return RegisterComponents(builder, assemblies.SelectMany(x => x.GetExportedTypes()));
        }
    
        /// <summary>
        /// Registers the components found in the given set of types.
        /// </summary>
        public static IRegistrationBuilder<object, ScanningActivatorData, DynamicRegistrationStyle> RegisterComponents(this ContainerBuilder builder, IEnumerable<Type> types)
        {
            return builder            .RegisterTypes(types.Where(t => t.GetCustomAttributes(typeof(ComponentAttribute), true).Any()).ToArray())
                .As(t => t.GetCustomAttributes(typeof(ComponentAttribute), true).OfType<ComponentAttribute>().First().RegisterAs ?? t);
        }
    
        /// <summary>
        /// Registers the components found in the given set of types.
        /// </summary>
        public static IRegistrationBuilder<object, ScanningActivatorData, DynamicRegistrationStyle> RegisterComponents(this ContainerBuilder builder, params Type[] types)
        {
            return RegisterComponents(builder, (IEnumerable<Type>)types);
        }
    }

Note that we leverage the built-in RegisterTypes extension method, filtering the incoming types so that the array passed to it contains only the selected candidates, and we use the RegisterAs attribute property to determine how to register the type. With this in place, we can simply build assemblies where components are annotated like:
    
    
    [Component(typeof(IAdapter))]
    public class MsBuildAdapter : IAdapter
    {
    }

And consume that easily from other components:
    
    
    [Component(typeof(IAdapterManager))]
    public class AdapterManager : IAdapterManager
    {
       public AdapterManager(IEnumerable<IAdapter> adapters)
       {
       }
    }

Where the registration code can simply be:
    
    
    var builder = new ContainerBuilder()
    builder.RegisterAssemblyComponents(Assembly.GetExecutingAssembly());
    
    var container = builder.Build();

You gotta love [Autofac](<https://bit.ly/12t9Cry>) ![:\)](/img/2013-06-05-1.gif)

/kzu
