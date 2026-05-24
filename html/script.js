const floorsDiv = document.getElementById("floors")

window.addEventListener("message", function(event){

    if(event.data.action == "open"){

        floorsDiv.innerHTML = ""

        event.data.floors.forEach((floor, index) => {

            const div = document.createElement("div")

            div.className = "floor"

            div.innerHTML = `
                <strong>${index + 1}</strong>
                - ${floor.label}
            `

            div.onclick = () => {
                fetch(`https://${GetParentResourceName()}/teleport`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },

                    body: JSON.stringify({
                        id: index + 1
                    })
                })
            }

            floorsDiv.appendChild(div)
        })
    }
})

document.addEventListener("keyup", function(e){

    if(e.key == "Escape"){

        fetch(`https://${GetParentResourceName()}/close`, {
            method: 'POST'
        })
    }
})