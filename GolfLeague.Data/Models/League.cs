using System;

namespace GolfLeague.Data
{
    public class League
    {
        public Guid ID { get; set; }
        public string LeagueName { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
