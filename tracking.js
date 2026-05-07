document.addEventListener("DOMContentLoaded", () => {
  const checkInBtn = document.getElementById("check-in-btn");
  const checkOutBtn = document.getElementById("check-out-btn");

  const statusEl = document.getElementById("status");
  const checkInTimeEl = document.getElementById("check-in-time");
  const checkOutTimeEl = document.getElementById("check-out-time");
  const durationEl = document.getElementById("duration");
  const pointsEl = document.getElementById("points");

  const progressFill = document.getElementById("progress-fill");
  const ulesScoreEl = document.getElementById("ules-score");

  if (!checkInBtn || !checkOutBtn) {
    console.error("Buttons not found in DOM");
    return;
  }

  const API_BASE = "/~*******";


  // LOADing  ULES SCORE
  
  async function loadULES() {
    try {
      const res = await fetch(`${API_BASE}/ules.php`);
      const data = await res.json();

      const score = parseInt(data.ules || 0);

      // show score
      ulesScoreEl.textContent = score + "%";

      // progress bar (100 = full)
      const percent = Math.min((score / 100) * 100, 100);
      progressFill.style.width = percent + "%";

    } catch (err) {
      console.error("ULES load error:", err);
    }
  }

  // load ULES on page start
  loadULES();

 
  // CHECK-IN implementation
  
  checkInBtn.addEventListener("click", async () => {
    try {
      const res = await fetch(`${API_BASE}/checkin.php`);
      const data = await res.json();

      if (!data.success) {
        alert(data.message || "Check-in failed");
        return;
      }

      statusEl.textContent = "Active";
      checkInTimeEl.textContent = data.time;

      checkInTimeEl.classList.add("highlight-time");

      checkOutTimeEl.textContent = "--:--";
      durationEl.textContent = "0 mins";
      pointsEl.textContent = "0";

      localStorage.setItem("session_id", data.id);

    } catch (err) {
      console.error("Check-in error:", err);
      alert("Server error during check-in");
    }
  });

 
  // CHECK-OUT implementation
  checkOutBtn.addEventListener("click", async () => {
    try {
      const id = localStorage.getItem("session_id");

      if (!id) {
        alert("No active session. Please check in first.");
        return;
      }

      const res = await fetch(`${API_BASE}/checkout.php?id=${encodeURIComponent(id)}`);
      const data = await res.json();

      if (!data.success) {
        alert(data.message || "Check-out failed");
        return;
      }

      statusEl.textContent = "Completed";
      checkOutTimeEl.textContent = data.check_out_time;
      durationEl.textContent = `${data.duration} mins`;
      pointsEl.textContent = data.points;

      localStorage.removeItem("session_id");

      // this  refresh ULES AFTER checkout
      loadULES();

    } catch (err) {
      console.error("Check-out error:", err);
      alert("Server error during check-out");
    }
  });
});