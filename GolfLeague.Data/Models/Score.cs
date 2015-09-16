using System;

namespace GolfLeague.Data
{
    class Score
    {
        public Guid ID { get; set; }
        public Guid RoundID { get; set; }
        public Guid HoleID { get; set; }
        public int Strokes { get; set; }
    }
}
