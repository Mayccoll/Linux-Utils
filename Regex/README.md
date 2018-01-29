### Get all between brackets

```regex
    \{(.|\n)*?\}
    
    (\{)(.*?)(\})
```


### Get all beetween 2 words

```regex
    (WORD)(.+?)(WORD)
    
    (WORD)(.*?)(WORD)
    
    (WORD)([\s\S]*?)(WORD)
    
    (WORD)([^;]*)(WORD)
```


### HTML get all between tags

```regex
    (<)(div)([\s\S]*?)(\/\2)(>)
```


### Select between 2 words and exclude lines with a words

```regex
    WORD(?!.*EXCLUDE.*)([\s\S]*?)WORD
```


### Select inside 2 words excluding last character

```regex
    (WORD)(.*?)(?=;)
```


### Get href tags

```regex
    <\s*\w*\s*href\s*=\s*"?\s*([\w\s%#\/\.;:_-]*)\s*"?.*?>
```


### Get links

```regex
    <\s*a(\s+.*?>|>).*?<\s*/\s*a\s*>
```


### Get html tags open and close

```regex
    </?\w+((\s+\w+(\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)/?>
```


### Removes comments from javascript.

```regex
    \/\*[\s\S]*?\*\/|\/\/.*
```


### Get file from path

```regex
    ([^\/]+)(?=\.\w+$)
    
    ([a-zA-Z0-9-_.]+\..*)
```

### Get image links

```regex
    (?!\"|\')http://[a-z0-9\-\.\/]+\.(?:jpe?g|png|gif)(?!\"|\')
```




