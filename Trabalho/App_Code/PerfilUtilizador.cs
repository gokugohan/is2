using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PerfilUtilizador
/// </summary>
public class PerfilUtilizador
{
    
	public PerfilUtilizador()
	{
	}

    public string Nome { get; set; }
    public string Apelido { get; set; }
    public string NumeroDeContato { get; set; }
    public string Email { get; set; }
    public string Rua { get; set; }
    public string CodigoPostal { get; set; }
    public string Cidade { get; set; }
    public string Pais { get; set; }

    public override string ToString()
    {
        return Nome + " " + Apelido + "<br>" + NumeroDeContato + "<br>" + Email + "<br>" +
            Rua + " " + CodigoPostal + " " + Cidade + " " + Pais;
    }
}