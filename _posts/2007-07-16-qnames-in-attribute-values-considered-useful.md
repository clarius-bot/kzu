---
layout: post
title: "Daniel Cazzulino's Blog - QNames in attribute values considered useful"
date: 2007-07-16 00:00:00 +0000
---

## QNames in attribute values considered useful 

Quite some time ago (around XML raise as a universal data format), the W3C seemed to be in doubt of the value of QNames (prefix + local name) in attribute values. 

One very clean evidence of this inconsistency around the best practice on QNames on attribute values is the W3C XML Schema specification, which was pretty happy with QNames in attributes:
    
    
    <?xml version="1.0" encoding="utf-8"?>  
    <xs:schema targetNamespace="my-schema"   
                  xmlns="my-schema"  
                  xmlns:xs="<http://www.w3.org/2001/XMLSchema">>  
      <xs:element name="element1" type="xs:string" />  
    </xs:schema>

At the same time and in the complete opposite direction, the RDF specification, developed around the same time as XML itself, clearly favors XML entities instead of allowing QNames on attributes:
    
    
    <?xml version="1.0"?>
    **<!DOCTYPE rdf:RDF [<!ENTITY xsd "http://www.w3.org/2001/XMLSchema#">]>
    **
    <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
             xmlns:exterms="http://www.example.org/terms/">
    
      <rdf:Description rdf:about="http://www.example.org/index.html">
        <exterms:creation-date **rdf:datatype=" &xsd;date"**>1999-08-16</exterms:creation-date>
      </rdf:Description>
    
    </rdf:RDF>

(from the [RDF Primer](http://www.w3.org/TR/rdf-primer/#rdfxml))

RDF explicitly forces the [rdfs:datatype](http://www.w3.org/TR/rdf-schema/#ch_datatype) and other attributes to be full [URI References](http://www.w3.org/TR/2004/REC-rdf-concepts-20040210/#section-Graph-URIref), which is why the only abbreviation mechanism is through XML entities. I find it hard to see why the above is any better than:
    
    
    <?xml version="1.0"?>
    <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"  
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
             xmlns:exterms="http://www.example.org/terms/">
    
      <rdf:Description rdf:about="http://www.example.org/index.html">
        <exterms:creation-date **rdf:datatype="xsd:date"** >1999-08-16</exterms:creation-date>
      </rdf:Description>
    
    </rdf:RDF>

Given that XML Schema, SOAP, even XAML heavly uses QNames in attributes, I believe RDF is now in an awkward position maitaining that annoying restriction. It would be as simple to solve as saying "when a QName is used, it will be expanded using the XML prefix mapping in scope, plus the fragment identifier '#' plus the local name", so that xsd:date becomes <http://www.w3.org/2001/XMLSchema#date>.

/kzu
