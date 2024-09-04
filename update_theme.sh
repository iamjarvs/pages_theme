#!/bin/bash

# Update _layouts/default.html
cat << EOF > _layouts/default.html
<!DOCTYPE html>
<html lang="en">
  {% include head.html %}
  <body>
    {% include header.html %}
    <div class="container">
      {% include sidebar.html %}
      <main>
        {{ content }}
      </main>
    </div>
    {% include footer.html %}
    <script src="{{ '/assets/js/main.js' | relative_url }}"></script>
  </body>
</html>
EOF

# Update _includes/head.html
cat << EOF > _includes/head.html
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{% if page.title %}{{ page.title }} - {% endif %}{{ site.title }}</title>
  <link rel="stylesheet" href="{{ '/assets/css/styles.css' | relative_url }}">
  <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</head>
EOF

# Create _includes/sidebar.html
cat << EOF > _includes/sidebar.html
<aside id="sidebar" class="sidebar">
  <button id="sidebarToggle" class="sidebar-toggle">
    <i class="fas fa-bars"></i>
  </button>
  <nav class="sidebar-nav">
    <ul>
      <li><a href="{{ '/' | relative_url }}">Home</a></li>
      <li><a href="{{ '/about/' | relative_url }}">About</a></li>
      <li><a href="{{ '/blog/' | relative_url }}">Blog</a></li>
      <li><a href="{{ '/contact/' | relative_url }}">Contact</a></li>
    </ul>
  </nav>
</aside>
EOF

# Update _includes/header.html
cat << EOF > _includes/header.html
<header class="site-header">
  <div class="header-content">
    <h1 class="site-title"><a href="{{ '/' | relative_url }}">{{ site.title }}</a></h1>
    <nav class="site-nav">
      <a href="{{ '/' | relative_url }}">Home</a>
      <a href="{{ '/about/' | relative_url }}">About</a>
      <a href="{{ '/blog/' | relative_url }}">Blog</a>
      <a href="{{ '/contact/' | relative_url }}">Contact</a>
    </nav>
  </div>
</header>
EOF

# Update _includes/footer.html
cat << EOF > _includes/footer.html
<footer class="site-footer">
  <div class="footer-content">
    <p>&copy; {{ site.time | date: '%Y' }} {{ site.title | default: site.github.repository_name }}. All rights reserved.</p>
    <nav class="footer-nav">
      <a href="{{ '/privacy/' | relative_url }}">Privacy Policy</a>
      <a href="{{ '/terms/' | relative_url }}">Terms of Service</a>
    </nav>
  </div>
</footer>
EOF

# Update _sass/main.scss
cat << EOF > _sass/main.scss
body {
  font-family: Arial, sans-serif;
  line-height: 1.6;
  margin: 0;
  padding: 0;
}

.container {
  display: flex;
  min-height: 100vh;
}

.sidebar {
  background-color: #f4f4f4;
  width: 250px;
  padding: 20px;
  transition: transform 0.3s ease-in-out;
}

.sidebar.collapsed {
  transform: translateX(-230px);
}

.sidebar-toggle {
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
  position: absolute;
  top: 10px;
  right: 10px;
}

.sidebar-nav ul {
  list-style-type: none;
  padding: 0;
}

.sidebar-nav li {
  margin-bottom: 10px;
}

main {
  flex-grow: 1;
  padding: 20px;
}

.site-header {
  background-color: #333;
  color: white;
  padding: 1rem;
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.site-title a {
  color: white;
  text-decoration: none;
}

.site-nav a {
  color: white;
  margin-left: 1rem;
  text-decoration: none;
}

.site-footer {
  background-color: #333;
  color: white;
  padding: 1rem;
  text-align: center;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.footer-nav a {
  color: white;
  margin-left: 1rem;
  text-decoration: none;
}
EOF

# Update assets/js/main.js
cat << EOF > assets/js/main.js
document.addEventListener('DOMContentLoaded', (event) => {
  const sidebar = document.getElementById('sidebar');
  const sidebarToggle = document.getElementById('sidebarToggle');

  sidebarToggle.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
  });
});
EOF

# Update _config.yml
cat << EOF >> _config.yml

# Navigation
nav_links:
  - title: Home
    url: /
  - title: About
    url: /about/
  - title: Blog
    url: /blog/
  - title: Contact
    url: /contact/
EOF
