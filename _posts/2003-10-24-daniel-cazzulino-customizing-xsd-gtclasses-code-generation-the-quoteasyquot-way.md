---
layout: post
title: "Daniel Cazzulino : Customizing XSD-&gt;Classes code generation, the &quot;easy&quot; way"
date: 2003-10-24 00:00:00 +0000
---

Daniel Cazzulino : Customizing XSD-&gt;Classes code generation, the &quot;easy&quot; way

### Search

[Go](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Singleweblogsearch1$_ctl0$SearchButton',''\))

### Subscriptions

  * [RSS 2.0](http://clariusconsulting.net/blogs/kzu/rss.aspx)
  * [Atom 0.3](http://clariusconsulting.net/blogs/kzu/atom.aspx)
  * [Contact](http://clariusconsulting.net/blogs/kzu/contact.aspx)

| [<](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2131'\))| December 2005| [>](javascript:__doPostBack\('_ctl0$_ctl0$_ctl0$_ctl0$BlogSideBar1$_ctl0$Cal$_ctl0$PostCalendar','V2192'\))  
---|---|---  
Su| Mo| Tu| We| Th| Fr| Sa  
27| 28| 29| 30| 1| 2| [3](http://clariusconsulting.net/blogs/kzu/archive/2003/10/3.aspx "1 Post")  
4| [5](http://clariusconsulting.net/blogs/kzu/archive/2003/10/5.aspx "1 Post")| 6| [7](http://clariusconsulting.net/blogs/kzu/archive/2003/10/7.aspx "1 Post")| 8| [9](http://clariusconsulting.net/blogs/kzu/archive/2003/10/9.aspx "2 Posts")| [10](http://clariusconsulting.net/blogs/kzu/archive/2003/10/10.aspx "3 Posts")  
[11](http://clariusconsulting.net/blogs/kzu/archive/2003/10/11.aspx "1 Post")| [12](http://clariusconsulting.net/blogs/kzu/archive/2003/10/12.aspx "2 Posts")| 13| 14| 15| 16| [17](http://clariusconsulting.net/blogs/kzu/archive/2003/10/17.aspx "2 Posts")  
18| 19| 20| [21](http://clariusconsulting.net/blogs/kzu/archive/2003/10/21.aspx "1 Post")| 22| 23| [24](http://clariusconsulting.net/blogs/kzu/archive/2003/10/24.aspx "1 Post")  
[25](http://clariusconsulting.net/blogs/kzu/archive/2003/10/25.aspx "1 Post")| [26](http://clariusconsulting.net/blogs/kzu/archive/2003/10/26.aspx "1 Post")| [27](http://clariusconsulting.net/blogs/kzu/archive/2003/10/27.aspx "1 Post")| [28](http://clariusconsulting.net/blogs/kzu/archive/2003/10/28.aspx "1 Post")| 29| 30| 31  
1| 2| 3| 4| 5| 6| 7  
  
  

### Post Categories

  * [All .NET](http://clariusconsulting.net/blogs/kzu/archive/category/1023.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1023)
  * [All Technology](http://clariusconsulting.net/blogs/kzu/archive/category/1035.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1035)
  * [ASP.NET](http://clariusconsulting.net/blogs/kzu/archive/category/1024.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1024)
  * [Books](http://clariusconsulting.net/blogs/kzu/archive/category/1022.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1022)
  * [GAT](http://clariusconsulting.net/blogs/kzu/archive/category/1038.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1038)
  * [Miscelaneous](http://clariusconsulting.net/blogs/kzu/archive/category/1026.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1026)
  * [Movies](http://clariusconsulting.net/blogs/kzu/archive/category/1027.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1027)
  * [Patterns & Practices](http://clariusconsulting.net/blogs/kzu/archive/category/1037.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1037)
  * [Shadowfax](http://clariusconsulting.net/blogs/kzu/archive/category/1032.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1032)
  * [XML](http://clariusconsulting.net/blogs/kzu/archive/category/1021.aspx) [(rss)](http://clariusconsulting.net/blogs/kzu/rss.aspx?CategoryID=1021)

## Customizing XSD-&gt;Classes code generation, the &quot;easy&quot; way 

Update: check a more thorough explanation of this techique in [ Code Generation in the .NET Framework Using XML Schema](http://msdn.microsoft.com/xml/default.aspx?pull=/library/en-us/dnxmlnet/html/xsdcodegen.asp) article published in the [MSDN XML DevCenter](http://msdn.microsoft.com/xml/), and the companion post on [the VS.NET custom tool](http://weblogs.asp.net/cazzu/archive/2004/05/14/XsdCodeGenTool.aspx) for it.

I've always been disgusted by the imposibility to customize XSD.EXE tool. I've even thought about [some workaround](http://weblogs.asp.net/cazzu/posts/25460.aspx) for the all-public-fields issue. However, I was  WRONG. It's perfectly possible to generate fully customized classes from an XSD Schema, if not by calling XSD.EXE, by reusing the very same classes it uses. 

This is achievable without any reflection hack! All public (althought certainly undocumented) classes and methods are used.

The "trick" involves using two key classes: `XmlSchemaImporter` and ` XmlCodeExporter`, both from the `System.Xml.Serialization` namespace. 

`
    
    
    // Load the schema to process.
    XmlSchema xsd = XmlSchema.Read( stm, null );
    
    // Collection of schemas for the XmlSchemaImporter
    XmlSchemas xsds = new XmlSchemas();
    xsds.Add( xsd );
    XmlSchemaImporter imp = new XmlSchemaImporter( xsds );
    
    // System.CodeDom namespace for the XmlCodeExporter to put classes in
    CodeNamespace ns = new CodeNamespace( "Generated" );
    XmlCodeExporter exp = new XmlCodeExporter( ns );
    
    // Iterate schema items (top-level elements only) and generate code for each
    foreach ( XmlSchemaObject item in xsd.Items )
    {
      if ( item is XmlSchemaElement )
      {
        // Import the mapping first
        XmlTypeMapping map = imp.ImportTypeMapping(
          new XmlQualifiedName( ( ( XmlSchemaElement ) item ).Name, 
          xsd.TargetNamespace ) );
        // Export the code finally
        exp.ExportTypeMapping( map );
      }
    }
    
    // Code generator to build code with.
    ICodeGenerator generator = new CSharpCodeProvider().CreateGenerator();
    
    // Generate untouched version
    using ( StreamWriter sw = new StreamWriter( @"E:\Generated.Full.cs", false ) )
    {
      generator.GenerateCodeFromNamespace(
        ns, sw, new CodeGeneratorOptions() );
    }

`

The `CodeNamespace` variable `ns` contains a full `CodeDom` hierarchy with all the types that were generated. Therefore, we can easily customize their definitions by adding attributes, custom methods, etc. Even converting those annoying public fields to properties, which is now much more robust than the find-and-replace method I used on a previous life :): 

+ FieldsToProperties method 

`
    
    
    		
    static void FieldsToProperties(CodeNamespace ns)
    {
      // Copy the colletion to an array for safety. We will be 
      // changing this collection.
      CodeTypeDeclaration[] types = new CodeTypeDeclaration[ns.Types.Count];
      ns.Types.CopyTo( types, 0 );
    
      // Turn fields into properties
      foreach ( CodeTypeDeclaration type in types )
      {
        // Copy the colletion to an array for safety. We will be 
        // changing this collection.
        CodeTypeMember[] members = new CodeTypeMember[type.Members.Count];
        type.Members.CopyTo(members, 0);
    
        foreach ( CodeTypeMember member in members )
        {
          // Process fields only.
          if ( member is CodeMemberField )
          {
            CodeMemberProperty prop = new CodeMemberProperty();
            prop.Name = member.Name;
            // Rename field
            member.Name = String.Concat( "_", member.Name.ToLower() );
    
            prop.Attributes = member.Attributes;
            prop.Type = ( ( CodeMemberField )member ).Type;
            prop.HasGet = true;
            prop.HasSet = true;
    
            // Add get/set statements pointing to field.
            prop.GetStatements.Add( 
              new CodeMethodReturnStatement( 
              new CodeFieldReferenceExpression( new CodeThisReferenceBLOCKED EXPRESSION, 
              member.Name ) ) );
            prop.SetStatements.Add(
              new CodeAssignStatement(
              new CodeFieldReferenceExpression( new CodeThisReferenceBLOCKED EXPRESSION,
              member.Name ), 
              new CodeArgumentReferenceExpression( "value" ) ) );
    
            // Copy attributes from field to the property.
            prop.CustomAttributes.AddRange(member.CustomAttributes);
            member.CustomAttributes.Clear();
            // Make field private
            member.Attributes = MemberAttributes.Private;
            // Finally add the property to the type
            type.Members.Add( prop );
          }
        }
      }
    }

`

Now, simply passing the namespace generated by the previous code will result in custom classes with properties instead of fields, with the appropriate XmlSerialization attributes as generated initially. Below is the customized complete schema for the Pubs database:

+ Pubs XSD schema customized. 

`
    
    
    namespace Lagash.Generated {
        
        
        /// <remarks/>
        [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.lagash.com/schemas")]
        [System.Xml.Serialization.XmlRootAttribute(Namespace="http://www.lagash.com/schemas", IsNullable=false)]
        public class dsPubs {
            
            /// <remarks/>
            private dsPubsPublishers[] _items;
            
            [System.Xml.Serialization.XmlElementAttribute("publishers")]
            public dsPubsPublishers[] Items {
                get {
                    return this._items;
                }
                set {
                    this._items = value;
                }
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.lagash.com/schemas")]
        public class dsPubsPublishers {
            
            /// <remarks/>
            private string _pub_id;
            
            /// <remarks/>
            private string _pub_name;
            
            /// <remarks/>
            private string _city;
            
            /// <remarks/>
            private string _state;
            
            /// <remarks/>
            private string _country;
            
            /// <remarks/>
            private dsPubsPublishersTitles[] _titles;
            
            public string pub_id {
                get {
                    return this._pub_id;
                }
                set {
                    this._pub_id = value;
                }
            }
            
            public string pub_name {
                get {
                    return this._pub_name;
                }
                set {
                    this._pub_name = value;
                }
            }
            
            public string city {
                get {
                    return this._city;
                }
                set {
                    this._city = value;
                }
            }
            
            public string state {
                get {
                    return this._state;
                }
                set {
                    this._state = value;
                }
            }
            
            public string country {
                get {
                    return this._country;
                }
                set {
                    this._country = value;
                }
            }
            
            [System.Xml.Serialization.XmlElementAttribute("titles")]
            public dsPubsPublishersTitles[] titles {
                get {
                    return this._titles;
                }
                set {
                    this._titles = value;
                }
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.lagash.com/schemas")]
        public class dsPubsPublishersTitles {
            
            /// <remarks/>
            private string _title_id;
            
            /// <remarks/>
            private string _title;
            
            /// <remarks/>
            private string _type;
            
            /// <remarks/>
            private string _pub_id;
            
            /// <remarks/>
            private string _price;
            
            /// <remarks/>
            private string _advance;
            
            /// <remarks/>
            private string _royalty;
            
            /// <remarks/>
            private string _ytd_sales;
            
            /// <remarks/>
            private string _notes;
            
            /// <remarks/>
            private string _pubdate;
            
            public string title_id {
                get {
                    return this._title_id;
                }
                set {
                    this._title_id = value;
                }
            }
            
            public string title {
                get {
                    return this._title;
                }
                set {
                    this._title = value;
                }
            }
            
            public string type {
                get {
                    return this._type;
                }
                set {
                    this._type = value;
                }
            }
            
            public string pub_id {
                get {
                    return this._pub_id;
                }
                set {
                    this._pub_id = value;
                }
            }
            
            public string price {
                get {
                    return this._price;
                }
                set {
                    this._price = value;
                }
            }
            
            public string advance {
                get {
                    return this._advance;
                }
                set {
                    this._advance = value;
                }
            }
            
            public string royalty {
                get {
                    return this._royalty;
                }
                set {
                    this._royalty = value;
                }
            }
            
            public string ytd_sales {
                get {
                    return this._ytd_sales;
                }
                set {
                    this._ytd_sales = value;
                }
            }
            
            public string notes {
                get {
                    return this._notes;
                }
                set {
                    this._notes = value;
                }
            }
            
            public string pubdate {
                get {
                    return this._pubdate;
                }
                set {
                    this._pubdate = value;
                }
            }
        }
    }

`

  

+ Complete Pubs XSD 

`
    
    
    		
    <?xml version="1.0" ?>
    <xs:schema id="dsPubs" targetNamespace="http://www.lagash.com/schemas" xmlns:mstns="http://www.lagash.com/schemas"
      xmlns="http://www.lagash.com/schemas" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata"
      attributeFormDefault="qualified" elementFormDefault="qualified">
      <xs:element name="dsPubs" msdata:IsDataSet="true" msdata:EnforceConstraints="False">
        <xs:complexType>
          <xs:choice maxOccurs="unbounded">
            <xs:element name="publishers">
              <xs:complexType>
                <xs:sequence>
                  <xs:element name="pub_id" type="xs:string" minOccurs="0" />
                  <xs:element name="pub_name" type="xs:string" minOccurs="0" />
                  <xs:element name="city" type="xs:string" minOccurs="0" />
                  <xs:element name="state" type="xs:string" minOccurs="0" />
                  <xs:element name="country" type="xs:string" minOccurs="0" />
                  <xs:element name="titles" minOccurs="0" maxOccurs="unbounded">
                    <xs:complexType>
                      <xs:sequence>
                        <xs:element name="title_id" type="xs:string" minOccurs="0" />
                        <xs:element name="title" type="xs:string" minOccurs="0" />
                        <xs:element name="type" type="xs:string" minOccurs="0" />
                        <xs:element name="pub_id" type="xs:string" minOccurs="0" />
                        <xs:element name="price" type="xs:string" minOccurs="0" />
                        <xs:element name="advance" type="xs:string" minOccurs="0" />
                        <xs:element name="royalty" type="xs:string" minOccurs="0" />
                        <xs:element name="ytd_sales" type="xs:string" minOccurs="0" />
                        <xs:element name="notes" type="xs:string" minOccurs="0" />
                        <xs:element name="pubdate" type="xs:string" minOccurs="0" />
                      </xs:sequence>
                    </xs:complexType>
                  </xs:element>
                </xs:sequence>
              </xs:complexType>
            </xs:element>
          </xs:choice>
        </xs:complexType>
      </xs:element>
    </xs:schema>

`

posted on Friday, October 24, 2003 2:28 PM by [kzu](http://clariusconsulting.net/user/Profile.aspx?UserID=1004)

[Post a Comment](http://clariusconsulting.net/blogs/kzu/comments/96.aspx) :: 

  

![](/web/20051225003931im_/http://clariusconsulting.net/Themes/default/images/hdr-KZU.jpg)