//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Lab_21_Kiko
{
    using System;
    using System.Collections.Generic;
    
    public partial class связб
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public связб()
        {
            this.Объём_работ_на_объекте = new HashSet<Объём_работ_на_объекте>();
            this.Справочник_расценок = new HashSet<Справочник_расценок>();
        }
    
        public int код_работы { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Объём_работ_на_объекте> Объём_работ_на_объекте { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Справочник_расценок> Справочник_расценок { get; set; }
    }
}
