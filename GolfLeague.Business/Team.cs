using System;

namespace GolfLeague.Business
{
    class Team
    {
        public Guid ID { get; set; }
        public Guid DivisionID { get; set; }
        public string TeamName { get; set; }
    }
}
