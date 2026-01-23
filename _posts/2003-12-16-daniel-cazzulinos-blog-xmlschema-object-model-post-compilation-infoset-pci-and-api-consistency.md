---
layout: post
title: "Daniel Cazzulino's Blog : XmlSchema Object Model, Post-compilation InfoSet (PCI) and API consistency"
date: 2003-12-16 00:00:00 +0000
---

## XmlSchema Object Model, Post-compilation InfoSet (PCI) and API consistency 

The Schema Object Model (SOM), much like the DOM, holds pre- and post-compilation (validation for DOM) information items. However, the model is not consistent for both, in the case of the SOM. For example, for the pre-compilation phase, you iterate the top-level items through the XmlSchema.Items collection:

`
    
    
    foreach (XmlSchemaObject item in xsd.Items)

`

On the other hand, after schema compilation, when all the items in that "cat bag" go to the corresponding `XmlSchema.Attributes`, `XmlSchema.Elements` and `XmlSchema.SchemaTypes ` properties, you can't keep iterating like that because now the iterator returned by the `XmlSchemaObjectTable.GetEnumerator` (they are all of that type), returns an `IDictionaryEnumerator`, meaning you now have to use either:

`
    
    
    foreach (DictionaryEntry entry in xsd.Elements)
    {
        XmlSchemaElement el = (XmlSchemaElement) entry.Value;
        //...
    }

`

or: 

`
    
    
    foreach (XmlSchemaElement el in xsd.Elements.Values)

`

Which isn't very consistent with the approach for pre-compilation equivalent property. Besides, it's always a bit cumbersome having to deal with two sets of available properties for the pre/post state.   
I'm wondering whether it would be better to have a separate object model extending the pre- one and adding the new post- ones. I think a cool API design would be to turn all of the pre- SOM to interfaces, and make the concrete pre/post implement it. The later could implement them explicitly, so that by default you don't have to "see" the pre- when you're dealing with the post- SOM.   
Any thoughts? 

/kzu
