using System;

namespace MoodStreamer.Shared
{
    class Utils
    {
    }

    public static class Extentions
    {

        /// <summary>
        /// A handy extention method to add a space wherever there is an uppercase char
        /// Example:
        ///     Input: "ANiceVariable"
        ///     Output: "A Nice Variable" 
        /// </summary>
        /// <param name="theString">The string to split on Upper Case</param>
        /// <returns>The string with spaces insterted where upper case occurs</returns>
        public static string SplitPascal(this string theString)
        {
            string retVal = String.Empty;
            int count = 0;
            foreach (var c in theString)
            {
                if (count>0 && Char.IsUpper(c))
                    retVal +=" ";
                retVal += c;
                count++;
            }

            return retVal;
        }
    }
}