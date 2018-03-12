using System;

namespace CrudEmployees.Utils
{
    public static class Format
    {
        public static string ToDateForTextBox(this DateTime value) => value.ToString("yyyy-MM-dd");
    }
}
