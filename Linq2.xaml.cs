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
    /// Логика взаимодействия для Linq2.xaml
    /// </summary>
    public partial class Linq2 : Window
    {
        public Linq2()
        {
            InitializeComponent();
        }
        int kol;
        int su = 0;
        Lab_21Entities db = Lab_21Entities.GetContext();
        private void Rez_ClIck(object sender, RoutedEventArgs e)
        {
            su = 0;
            kol = Convert.ToInt32(Id_product.Text);
            var value = from p in db.Справочник_расценок
                        join c in db.Объём_работ_на_объекте on p.Код_работы equals c.Код_работы
                        where p.Код_работы == kol & p.Код_работы== c.Код_работы
                        select new { p.Расценка_за_ед_имерения, c.Физ_объем_ед_измерения };
            foreach (var item in value)
            {
                su += Convert.ToInt32(item.Расценка_за_ед_имерения * item.Физ_объем_ед_измерения);
            }
            Rez.Text = Convert.ToString(su);
        }
    }
}
