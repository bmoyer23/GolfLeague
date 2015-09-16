using System;


namespace GolfLeague.Data
{
    class TeamPlayer
    {
        public Guid ID { get; set; }
        public Guid TeamID { get; set; }
        public Guid PlayerID { get; set; }
    }
}
