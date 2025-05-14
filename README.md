# My Hugo Site

This is a personal website built with [Hugo](https://gohugo.io/), using the [Hugo Clarity](https://github.com/chipzoller/hugo-clarity) theme.

## Development

### Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) (check version in `hugo.toml`)
- Git

### Setup Local Development

1. Clone this repository
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
   cd YOUR_REPOSITORY
   ```

2. Initialize and update the theme submodule
   ```bash
   git submodule init
   git submodule update
   ```

3. Start the local development server
   ```bash
   hugo server -D
   ```

4. View your site at http://localhost:1313/

## Creating Content

```bash
# Create a new post
hugo new content/posts/my-post.md
```

## Build for Production

```bash
hugo --minify
```

The static files will be generated in the `public/` directory.

## Deployment

The site can be deployed to any static site hosting service like GitHub Pages, Netlify, Vercel, etc.

## License

[MIT](LICENSE) 