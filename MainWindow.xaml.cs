using System;
using System.Collections.Generic;
using System.Data.Entity;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Lab_21_Kiko
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        Lab_21Entities db = Lab_21Entities.GetContext();
        private void Linq_1(object sender, RoutedEventArgs e)
        {
            Linq1 linq1 = new Linq1();
            linq1.ShowDialog();
        }

        private void Linq_2(object sender, RoutedEventArgs e)
        {
            Linq2 linq1 = new Linq2();
            linq1.ShowDialog();
        }

        private void Window_Activated(object sender, EventArgs e)
        {
            db.Объём_работ_на_объекте.Load();
            db.Справочник_видов_работ.Load();
            db.Справочник_окончани_работ.Load();
            db.Справочник_расценок.Load();
            db.Справочник_строительных_объектов.Load();
            Date_1.ItemsSource = db.Справочник_видов_работ.Local.ToBindingList();
            Date_2.ItemsSource = db.Справочник_расценок.Local.ToBindingList();
            Date_3.ItemsSource = db.Справочник_строительных_объектов.Local.ToBindingList();
            Date_4.ItemsSource = db.Объём_работ_на_объекте.Local.ToBindingList();
            Date_5.ItemsSource = db.Справочник_окончани_работ.Local.ToBindingList();
        }

        private void Linq_25(object sender, RoutedEventArgs e)
        {
            linq5 linq5 = new linq5();
            linq5.ShowDialog();
        }

        private void Linq_24(object sender, RoutedEventArgs e)
        {
            Linq24 linq24 = new Linq24();
            linq24.ShowDialog();

        }

        private void Linq_23(object sender, RoutedEventArgs e)
        {
            linq23 linq21 = new linq23();
            linq21.ShowDialog();
        }

        private void Linq_22(object sender, RoutedEventArgs e)
        {
            Linq22 linq22 = new Linq22();
            linq22.ShowDialog();
        }

        private void Linq_21(object sender, RoutedEventArgs e)
        {
            Linq21 linq21 = new Linq21();
            linq21.ShowDialog();
        }
    }
}
