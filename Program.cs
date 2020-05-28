using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DisqueraEntityFramework
{
    class Program
    {
        static void Main(string[] args)
        {
            using (DBDisQuera db = new DBDisQuera())
            {
                /*Cancion cancion = new Cancion();
                cancion.Nombre = "Enter Sadman";
                cancion.Duracion = 5;
                cancion.Genero = "RockMetal";
                cancion.Descripcion = "Heavy";

                db.Cancion.Add(cancion);
                db.SaveChanges();

                Cancion cancion = db.Cancion.Find();*/
                Cancion cancion = db.Cancion.Where(d => d.Nombre == "Drive").First();
                cancion.Genero = "Balada Pop";
                db.Entry(cancion).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();

                db.Cancion.Remove(cancion);
                db.SaveChanges();

                var lst = db.Cancion;
                foreach (var Cancion in lst)
                {
                    Console.WriteLine(Cancion.Nombre);
                }
            }
            Console.Read();
        }
    }
}
