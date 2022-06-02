using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Lab_21_Kiko
{
    /// <summary>
    /// Логика взаимодействия для Linq21.xaml
    /// </summary>
    public partial class Linq21 : Window
    {
        public Linq21()
        {
            InitializeComponent();
        }
       
        Lab_21Entities db = Lab_21Entities.GetContext();
        private void Rez_ClIck(object sender, RoutedEventArgs e)
        {
            Rez.Items.Clear();
            object[] vs = new object[db.Справочник_строительных_объектов.Max(p => p.Код_объекта)];
            int str =Convert.ToInt32( Id_product.Text);
            var value = from p in db.Справочник_строительных_объектов
                        join c in db.Объём_работ_на_объекте on p.Код_объекта equals c.Код_объекта
                        join v in db.Справочник_расценок on c.Код_работы equals v.Код_работы
                        where v.Код_вида_работ == str
                        orderby v.Код_вида_работ descending
                        select new { p.Наименование_объекта, v.Код_вида_работ,v.Наименование_работ};
            int i = 0;
            foreach (var item in value)
            {
                vs[i] = item;
                i++;
            }
            for (int j = 0; j < vs.Length; j++)
            {
                Rez.Items.Add(vs[j]);
            }
        }
    }
}
