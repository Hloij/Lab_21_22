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
    /// Логика взаимодействия для Linq24.xaml
    /// </summary>
    public partial class Linq24 : Window
    {
        public Linq24()
        {
            InitializeComponent();
        }
        Lab_21Entities db = Lab_21Entities.GetContext();
        private void Rez_ClIck(object sender, RoutedEventArgs e)
        {
            string str = string.Empty;
            var value = from p in db.Справочник_окончани_работ
                        select p;
            foreach (var item in value)
            {
                if (item.Дата_окончания_работ.Value.Date.Month == 7 || item.Дата_окончания_работ.Value.Date.Month == 8 || item.Дата_окончания_работ.Value.Date.Month == 9)
                {
                    str += Convert.ToString(item.Код_объекта)+" ;";

                }              
            }
            Rez.Text = str;
        }
    }
}
