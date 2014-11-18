using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class LinqToXML : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        XElement xelement = readXML("Employees.xml");
        IEnumerable<XElement> employees = xelement.Elements();

        string temp = string.Empty;

        foreach (var employee in employees)
        {
            temp += "EmpId: " + employee.Element("EmpId").Value + "<br/>";
            temp += "Nome: " + employee.Element("Name").Value+"<br/>";
            temp += "Sex: " + employee.Element("Sex").Value + "<br/>";
            temp += "<hr/>";
        }

        Label1.Text = temp;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        XElement xelement = readXML("Employees.xml");
        var name = from nm in xelement.Elements("Employee")
                   where (String)nm.Element("Sex") == "Female"
                   select nm;
        string temp = "Details - female employees<br/>";
        foreach (XElement xEle in name)
        {
            temp += xEle + "<br/>";
        }
        Label1.Text = temp;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        XElement xelement = readXML("Employees.xml");
        var homePhone = from phone in xelement.Elements("Employee")
                        where (String)phone.Element("Phone").Attribute("Type") == "Home"
                        select phone;
        string temp = "Details - Phone attributes<br/>";
        foreach (XElement xEle in homePhone)
        {
            temp += xEle.Element("Name").Value+ ": " + xEle.Element("Phone").Value + "<br/>";
        }
        Label1.Text = temp;
    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        XElement xelement = readXML("Employees.xml");
        var addresses = from address in xelement.Elements("Employee")
                        where (string)address.Element("Address").Element("City") == "Alta"
                        select address;
        string temp = "Details of Employees living in Alta City<br/>";
        foreach (XElement xEle in addresses)
        {
            temp += "Address of " + xEle.Element("Name").Value + " is: <br/>" +
                "Street: " + xEle.Element("Address").Element("Street").Value +"<br/>" +
                "City: " + xEle.Element("Address").Element("City").Value + "<br/>" +
                "State: " + xEle.Element("Address").Element("State").Value + "<br/>" +
                "Zip: " + xEle.Element("Address").Element("Zip").Value + "<br/>" +
                "Country: " + xEle.Element("Address").Element("Country").Value + "<br/>";
        }
        Label1.Text = temp;
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        XElement xelement = readXML("Employees.xml");
        xelement.Add(new XElement("Employee",
                   new XElement("EmpId", 5),
                   new XElement("Name", "George"),
                   new XElement("Sex", "Male"),
                   new XElement("Phone", "423-555-4224", new XAttribute("Type", "Home")),
                   new XElement("Phone", "424-555-0545", new XAttribute("Type", "Work")),
                   new XElement("Address",
                       new XElement("Street", "Fred Park, East Bay"),
                       new XElement("City", "Acampo"),
                       new XElement("State", "CA"),
                       new XElement("Zip", "95220"),
                       new XElement("Country", "USA"))));
        xelement.Save(Server.MapPath("Employees.xml"));
        Label1.Text = (string)xelement;
    }


    private XElement readXML(string filename)
    {
        return XElement.Load(Server.MapPath(filename));
    }
}