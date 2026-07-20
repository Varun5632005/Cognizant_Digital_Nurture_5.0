function BlogDetails() {

  const blogs = [
    {
      id: 1,
      title: "React Learning",
      author: "Stephen Biz",
      description: "Welcome to learning React!"
    },
    {
      id: 2,
      title: "Installation",
      author: "Schwezdneier",
      description: "You can install React from npm."
    }
  ];

  return (
    <>
      <h1>Blog Details</h1>

      {blogs.map(blog => (
        <div key={blog.id}>
          <h2>{blog.title}</h2>
          <h3>{blog.author}</h3>
          <p>{blog.description}</p>
        </div>
      ))}
    </>
  );
}

export default BlogDetails;