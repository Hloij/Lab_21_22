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
    /// Логика взаимодействия для Linq22.xaml
    /// </summary>
    public partial class Linq22 : Window
    {
        public Linq22()
        {
            InitializeComponent();
        }
        Lab_21Entities db = Lab_21Entities.GetContext();
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Справочник_окончани_работ work = new Справочник_окончани_работ();
            work.Код_объекта =Convert.ToInt32(Id.Text);
            work.Дата_окончания_работ = Convert.ToDateTime(dat.Text);
            Справочник_строительных_объектов obj = new Справочник_строительных_объектов();
            obj.Код_объекта = work.Код_объекта;
            
                db.Справочник_окончани_работ.Add(work);
            db.Справочник_строительных_объектов.Add(obj);
                db.SaveChanges();
                this.Close();
            
           
        }
    }
}
