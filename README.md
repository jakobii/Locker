# Locker
A Powershell Module for Cryptographic Tasks. 


## Password Generating

The password generator extremely robust. but it also comes with some very sane easy to use default configurations.

This will generate a random password that is contains atleast 1 number, 1 special, 1 Uppercase, 1 Lower case and has a length of 32 characters.

```powershell
New-Password -Strong
```

`New-Password` supports Starbucks cup sizes and Smash Brother cpu levels as parameter aliases (for obvious nerd reasons).

View the help docs for a full list of default password types parameters.

```powershell
Help New-Password
```

You can customizes this to fit your exact needs. Here is an example of an extremely weak password that does not has numbers or special charsters.

```powershell
New-Password -Length 12 -MaxSpecials 0 -MaxNumbers 0 -MinUppers 4 -MinLowers 6 -Uppers 'EAJHGFRQ' -Lowers 'ertypasfghjkzxvbc'
```

## Credentials

`PSCredentials` can be generated with this cmdlet

```powershell
New-Credential -UserName 'YOUR USERNAME' -Password 'YOUR PASSWORD'
```


## Hashing

Objects can be hashed

```powershell
Get-Hash "what is the md5 hash of this sentance?"
```

Outputs :

```
81C934FD4C21C4B5113534E62F716278
```


You can get very granular as well.

```powershell
Get-Hash -InputObject "the details matter." -OutputAs 'Byte' -Algorithm 'SHA512' -Encoding 'UTF16'
```
