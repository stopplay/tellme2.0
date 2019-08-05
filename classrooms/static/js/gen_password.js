
function genPassword() {
    var charsLenght = 20;
    var password = '';
    
    var letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var numbers = '1234567890';
    var symbols = '!@#$%&*-+_=';

    var pickChar = [
        letters,
        numbers,
        symbols
    ];

    for (var i = 0; i < charsLenght; i++) {
        var pickString = getRandomStringSequenceFromStringsArray(pickChar);
        password += getRandomCharOfString(pickString)
    }

    return password;
}

function getRandomStringSequenceFromStringsArray(/** @type Array<string> */strsArray) {
    var charIndex = Math.floor(Math.random() * strsArray.length);
    return strsArray[charIndex];
}

function getRandomCharOfString(/** @type string */ str) {
    var charIndex = Math.floor(Math.random() * str.length);
    return str.charAt(charIndex);
}