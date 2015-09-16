using System;

namespace GolfLeague.Business
{
    public class Tee
    {
        public Guid ID { get; set; }
        public string TeeName { get; set; }
        public Guid CourseID { get; set; }
        public decimal CourseRating { get; set; }
        public int Slope { get; set; }
        public int Yardage { get; set; }
        public int Par { get; set; }
    }
}
