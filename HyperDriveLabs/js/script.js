document.addEventListener("DOMContentLoaded", () => {
    const elements = {
        carList: document.getElementById("car-list") // Container for car data
    };

    async function fetchData() {
        try {
            const response = await fetch("fetch_data.php");
            const data = await response.json();

            console.log("API Response:", data); // Debugging log

            // Clear existing data
            elements.carList.innerHTML = "";

            // Check if cars exist
            if (data.cars && Array.isArray(data.cars) && data.cars.length > 0) {
                data.cars.forEach(car => {
                    const carElement = document.createElement("div");
                    carElement.classList.add("car-item");
                    carElement.innerHTML = `
                        <p><strong>ID:</strong> ${car.id || "N/A"}</p>
                        <p><strong>Created At:</strong> ${car.createdAt}</p>
                        <p><strong>Last Emergency:</strong> ${car.lastEmergency}</p>
                    `;
                    elements.carList.appendChild(carElement);
                });
            } else {
                elements.carList.innerHTML = `
                    <p>No cars available.</p>
                    <p>Check back later or contact support if you believe this is an error.</p>
                `;
            }
        } catch (error) {
            console.error("Error fetching data:", error);
        }
    }

    fetchData();
    setInterval(fetchData, 5000);
});
