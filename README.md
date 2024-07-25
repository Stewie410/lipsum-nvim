## Word Generation

Words generated with [lipsum.com](https://www.lipsum.com), based on the
following options:

- 100,000 words
- Start with "Lorem ipsum dolor sit amet" enabled

Once produced, filtered the results with some `shellscript`:

```bash
tr -d '\n[:punct:]' < lorem.txt | \
    tr '[:upper:] ' '[:lower:]\n' | \
    awk '!seen[$0]++ { printf "\t\"%s\",\n", $1 }' | \
    sort
```

While this may not produce every possible word from the generator, on average
this produces around 300 unique words, which should be sufficient, hopefully.
