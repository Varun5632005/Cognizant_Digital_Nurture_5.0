import CourseDetails from "./components/CourseDetails";
import BookDetails from "./components/BookDetails";
import BlogDetails from "./components/BlogDetails";
import "./App.css";

function App() {
  const showCourses = true;
  const showBooks = true;
  const showBlogs = true;

  return (
    <div className="container">

      <div className="column">
        {showCourses ? <CourseDetails /> : <h2>No Courses</h2>}
      </div>

      <div className="column">
        {showBooks && <BookDetails />}
      </div>

      <div className="column">
        {showBlogs ? <BlogDetails /> : null}
      </div>

    </div>
  );
}

export default App;