using System;

namespace GolfLeague.BusinessObjects
{
    public class Player
    {
        public Guid ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public decimal HandicapIndex { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
    }
}
