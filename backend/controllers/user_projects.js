const pool = require("../data/index");
const { v4: uuidv4 } = require("uuid");

const addHourLog = async (req, res) => {
  const { user_id, project_id, hours_logged, description } = req.body;

  // Check if all required fields are provided
  if (!user_id || !project_id || !hours_logged) {
    return res.status(400).json({
      success: false,
      message: "Please provide user_id, project_id, and hours_logged",
    });
  }

  try {
    // Check if the user exists
    const userExists = await pool.query("SELECT * FROM users WHERE id=$1", [
      user_id,
    ]);
    if (userExists.rowCount === 0) {
      return res.status(404).json({
        success: false,
        message: "User not found",
      });
    }

    // Check if the project exists
    const projectExists = await pool.query(
      "SELECT * FROM projects WHERE id=$1",
      [project_id]
    );
    if (projectExists.rowCount === 0) {
      return res.status(404).json({
        success: false,
        message: "Project not found",
      });
    }

    // Insert the new hour log
    const newHourLog = await pool.query(
      `INSERT INTO hour_logs (user_id, project_id, hours_logged, description) 
       VALUES ($1, $2, $3, $4) 
       RETURNING *`,
      [user_id, project_id, hours_logged, description]
    );

    // Respond with the newly created hour log
    res.status(201).json({
      success: true,
      message: "Hour log added successfully",
      hour_log: newHourLog.rows[0],
    });
  } catch (err) {
    console.error("Error in addHourLog:", err.message);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

module.exports = {
  addHourLog,
};

//66d6e315-b9a4-4c57-a181-d51fb1c5bd61
//984ba7d9-40f8-448f-b5da-7d9ec568cb3a
// curl -X POST http://localhost:4000/api/v1/hourlogs \
//   -H "Content-Type: application/json" \
//   -d '{"user_id": "your-user-id", "project_id": "your-project-id", "hours": 5, "date_logged": "2025-04-28"}'
