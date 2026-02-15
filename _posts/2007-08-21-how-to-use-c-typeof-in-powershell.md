---
layout: post
title: How to use C# typeof in Powershell
date: 2007-08-21 00:00:00 +0000
weblogs: https://weblogs.asp.net/cazzu/how-to-use-c-typeof-in-powershell
tags:
- .NET
- All Technology
- PowerShell

---

Have you ever missed C#'s "typeof" while working with PowerShell?
    
    
    PS C:\> [System.Type]::GetType("System.Enum") 
    
    
    IsPublic IsSerial Name                                     BaseType  
    -------- -------- ----                                     --------  
    True     True     Enum                                     System.ValueType 
    
    
    PS C:\> typeof System.Enum 
    
    
    IsPublic IsSerial Name                                     BaseType  
    -------- -------- ----                                     --------  
    True     True     Enum                                     System.ValueType 

I know I do. So I created the following snap-in:
    
    
    using System.Globalization;
    using System.Management.Automation;
    
    namespace Clarius.PowerShell
    {
        [Cmdlet(VerbsCommon.Get, "Type")]
        public class GetTypeCommand : Cmdlet
        {
            private string typeName;
    
            [Parameter(Mandatory=true, Position=0, HelpMessageResourceId="Parameter_TypeName")]
            public string TypeName
            {
                get { return typeName; }
                set { typeName = value; }
            }
    
            protected override void ProcessRecord()
            {
                string name = typeName;
                if (name.StartsWith("[")) name = name.Substring(1);
                if (name.EndsWith("]")) name = name.Substring(0, name.Length - 1);
    
                WriteObject(new TypeNameConverter().ConvertFrom(name, typeof(Type), CultureInfo.CurrentCulture, true));
            }
        }
    }
    

[](http://11011.net/software/vspaste)

And [after registering your snap-in](http://www.clariusconsulting.net/blogs/pga/archive/2006/08/08/643.aspx) you can add the following alias on [your profile](http://msdn2.microsoft.com/en-us/library/bb613488.aspx):
    
    
    set-alias typeof Get-Type

And now you can use your beloved "typeof" passing just the type name.

/kzu
