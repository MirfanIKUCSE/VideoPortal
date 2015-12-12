function dotString(str) {
    var dotStr = "";
    var orgStr = ""+str;
    if (orgStr.length > 60) {
        dotStr = orgStr.slice(0,30);
        dotStr += "...";
    }
    return dotStr;
}