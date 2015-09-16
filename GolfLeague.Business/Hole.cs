using System;

namespace GolfLeague.Business
{
    class Hole
    {
        public Guid ID { get; set; }
        public Guid TeeID { get; set; }
        public int HoleNo { get; set; }
        public string HoleName { get; set; }
        public int Par { get; set; }
        public int Handicap { get; set; }
        public int Yardage { get; set; }
    }
}
