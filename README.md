# [Open FUN Blog](https://openfun.github.io/blog)

[![Deployed](https://github.com/openfun/blog/actions/workflows/gh-pages.yml/badge.svg)](https://github.com/openfun/blog/actions/workflows/gh-pages.yml)

The technical blog of [Open FUN](https://github.com/openfun) powered by
[Hugo](https://github.com/https://github.com/gohugoio/hugo) and the
[blowfish](https://github.com/nunocoracao/blowfish) theme.

## Getting started

If this is the first time you use this repository you must run the following command:

```sh
make bootstrap
```

Next time you can simply use the command:

```sh
make run
```

to start the Hugo development server.

Once this is done, Hugo is served on http://localhost:1313 🎉.

You are now able to write content! Take a look at the [next section](#authoring) to know how to do.

## Authoring

### Create a new post

To create a new post, run the command :

```sh
make post
```

Then fill the prompt by providing the post title :

```sh
What is the title of the new post?
>>>
```

Once the post created, post content is stored into `/content/posts/<your-new-post>/` directory.

#### Thumbnail

Post images must be located into the same folder than the post itself. To use an image as thumbnail,
it must be prefixed by `feature-`.

### Add a new author

Author descriptions are located into `data/authors` and author images are located into
`assets/authors`.

```sh
cd data/authors
cp template.json <author_name>.json
```

Then fill all fields with your personal information.

#### Attach an author to a post

Within the post header, you can add an `authors` attributes. The author name corresponds to the name
of the file you created previously.

e.g:

```md
title: "Post title" ... authors:

- "<author_name>"

---
```

### Further information

Let's go further? Have a look at the documentation of
[blowfish](https://nunocoracao.github.io/blowfish/docs/) and
[Hugo](https://gohugo.io/documentation/).

## Contributing

This project is intended to be community-driven, so please, do not hesitate to get in touch if you
have any question related to our implementation or design decisions.

We try to raise our code quality standards and expect contributors to follow the recommendations
from our [handbook](https://openfun.gitbooks.io/handbook/content).

## License

### Blog source code

This work is released under the MIT License (see [LICENSE](./LICENSE-website.md)).

### Posts

This work is released under the CC-BY-SA 4.0 License (see [LICENSE](./LICENSE-posts.md)).
