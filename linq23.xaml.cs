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
    /// Логика взаимодействия для linq23.xaml
    /// </summary>
    public partial class linq23 : Window
    {
        public linq23()
        {
            InitializeComponent();
        }
        Lab_21Entities db = Lab_21Entities.GetContext();
        private void Rez_ClIck(object sender, RoutedEventArgs e)
        {
            int kol = Convert.ToInt32(Id_product.Text);
            double str=0;
            string Str = string.Empty;
            var value = from p in db.Справочник_строительных_объектов
                        join c in db.Справочник_окончани_работ on p.Код_объекта equals c.Код_объекта
                        where p.Код_объекта==kol
                        select new { p.Дата_начала_работ, c.Дата_окончания_работ };
            foreach (var item in value)
            {
                Str =Convert.ToString((item.Дата_окончания_работ - item.Дата_начала_работ).Value.Days);
            }
            str = Convert.ToDouble(Str);
            str = Math.Round((str * 0.032854884084021),2);
            Rez.Text = Convert.ToString(str);
        }
    }
}
