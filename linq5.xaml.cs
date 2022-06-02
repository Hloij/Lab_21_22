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
    /// Логика взаимодействия для linq5.xaml
    /// </summary>
    public partial class linq5 : Window
    {
        public linq5()
        {
            InitializeComponent();
        }
        Lab_21Entities db = Lab_21Entities.GetContext();
        private void Rez_ClIck(object sender, RoutedEventArgs e)
        {
            string str = "";
            var value = from p in db.Справочник_расценок
                        where p.Расценка_за_ед_имерения == db.Справочник_расценок.Max(c => c.Расценка_за_ед_имерения)
                        select p;
            foreach (var item in value)
            {
                str = item.Наименование_работ;
            }
            Rez.Text = str;    
        }
    }
}
