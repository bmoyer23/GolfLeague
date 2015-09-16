using System;

namespace GolfLeague.Business
{
    public class Round
    {
        public Guid ID { get; set; }
        public Guid TeeID { get; set; }
        public Guid PlayerID { get; set; }
        public int Handicap { get; set; }
        public string Description { get; set; }  
        public DateTime DatePlayed { get; set; } 
    }
}
