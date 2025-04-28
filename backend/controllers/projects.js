const pool = require("../data/index");
const { v4: uuidv4 } = require("uuid");

const addProject = async (req, res) => {
  const { projectTitle, userId } = req.body;

  if (!projectTitle || !userId) {
    return res.status(400).json({
      success: false,
      message: "Project title and user ID are required",
    });
  }

  try {
    // Check if the user exists before adding a project
    const userExists = await pool.query("SELECT * FROM users WHERE id=$1", [
      userId,
    ]);

    if (userExists.rowCount === 0) {
      return res.status(404).json({
        success: false,
        message: "User not found",
      });
    }

    // Generate unique project ID
    const projectId = uuidv4();

    // Insert the new project into the database
    const newProject = await pool.query(
      `INSERT INTO projects (id, project_title, user_id, date_created) VALUES ($1, $2, $3, NOW()) RETURNING *`,
      [projectId, projectTitle, userId]
    );

    // Send response with the new project data
    res.status(201).json({
      success: true,
      message: "Project added successfully",
      project: newProject.rows[0], // returning the new project
    });
  } catch (err) {
    console.error("Error adding project:", err.message);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

const editProject = async (req, res) => {
  const { hourLog, projectTitle, id } = req.body;

  if (!hourLog || !projectTitle || !id) {
    return res.status(400).json({
      success: false,
      message: "Please provide hourLog, projectTitle, and project ID.",
    });
  }

  try {
    // Check if project exists based on id
    const projectExists = await pool.query(
      "SELECT * FROM projects WHERE id = $1",
      [id]
    );

    if (projectExists.rowCount === 0) {
      return res.status(404).json({
        success: false,
        message: "Project not found.",
      });
    }

    // Generate date_created (current timestamp)
    const dateCreated = new Date();

    // Insert hour log and project title into the projects table (assuming we update the project)
    const updatedProject = await pool.query(
      `UPDATE projects 
       SET project_title = $1, hour_log = hour_log + $2, date_created = $3 
       WHERE id = $4 
       RETURNING *`,
      [projectTitle, hourLog, dateCreated, id]
    );

    res.status(200).json({
      success: true,
      message: "Hour log added successfully.",
      project: updatedProject.rows[0], // returning the updated project
    });
  } catch (err) {
    console.error("Error in editProject:", err.message);
    res.status(500).json({
      success: false,
      message: "Server error.",
    });
  }
};

module.exports = {
  editProject,
  addProject,
};
