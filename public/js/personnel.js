document.addEventListener("DOMContentLoaded", function () {

// =====================
// BIRTH PLACE
// =====================

document.getElementById('birth_place_region')
.addEventListener('change', function () {

    console.log("CHANGE EVENT FIRED");
    console.log("VALUE =", this.value);

    let regionId = this.value;
    if (!regionId) return; // prevent empty request
    fetch('/get-provinces/' + regionId)
        .then(res => res.json())
        .then(data => {

            let province =
                document.getElementById('birth_place_province');

            province.innerHTML =
                '<option value="">Select Province</option>';

            data.forEach(item => {
                province.innerHTML += `
                    <option value="${item.id}">
                        ${item.province_name}
                    </option>`;
            });

        });
        
        

});

// Municipality (Birth Place)
document.getElementById('birth_place_province')
.addEventListener('change', function () {
    console.log("CHANGE EVENT FIRED");
    console.log("VALUE =", this.value);
    let provinceId = this.value;
    if (!provinceId) return; // prevent empty request
    fetch('/get-municipalities/' + provinceId)
        .then(res => res.json())
        .then(data => {

            let municipality =
                document.getElementById('birth_place_municipality');

            municipality.innerHTML =
                '<option value="">Select Municipality</option>';

            data.forEach(item => {
                municipality.innerHTML += `
                    <option value="${item.id}">
                        ${item.municipality_name}
                    </option>`;
            });

        });

});
document.getElementById('birth_place_municipality')
.addEventListener('change', function () {

    console.log("MUNICIPALITY CHANGE FIRED");
    console.log("SELECTED VALUE:", this.value);

    let select = document.getElementById('birth_place_municipality');

    console.log("ALL OPTIONS:", select.options);
    console.log("CURRENT VALUE:", select.value);
});


// =====================
// PERMANENT ADDRESS
// =====================

// Province
document.getElementById('permanent_address_region')
.addEventListener('change', function () {

    let regionId = this.value;

    fetch('/get-provinces/' + regionId)
        .then(res => res.json())
        .then(data => {

            let province =
                document.getElementById('permanent_address_province');

            province.innerHTML =
                '<option value="">Select Province</option>';

            data.forEach(item => {
                province.innerHTML += `
                    <option value="${item.id}">
                        ${item.province_name}
                    </option>`;
            });

        });

});

// Municipality
document.getElementById('permanent_address_province')
.addEventListener('change', function () {

    let provinceId = this.value;

    fetch('/get-municipalities/' + provinceId)
        .then(res => res.json())
        .then(data => {

            let municipality =
                document.getElementById('permanent_address_municipality');

            municipality.innerHTML =
                '<option value="">Select Municipality</option>';

            data.forEach(item => {
                municipality.innerHTML += `
                    <option value="${item.id}">
                        ${item.municipality_name}
                    </option>`;
            });

        });

});

// Barangay
document.getElementById('permanent_address_municipality')
.addEventListener('change', function () {

    let municipalityId = this.value;

    fetch('/get-barangays/' + municipalityId)
        .then(res => res.json())
        .then(data => {

            let barangay =
                document.getElementById('permanent_address_barangay');

            barangay.innerHTML =
                '<option value="">Select Barangay</option>';

            data.forEach(item => {
                barangay.innerHTML += `
                    <option value="${item.id}">
                        ${item.barangay_name}
                    </option>`;
            });

        });

});


// =====================
// PRESENT ADDRESS
// =====================

// Province
document.getElementById('present_address_region')
.addEventListener('change', function () {

    let regionId = this.value;

    fetch('/get-provinces/' + regionId)
        .then(res => res.json())
        .then(data => {

            let province =
                document.getElementById('present_address_province');

            province.innerHTML =
                '<option value="">Select Province</option>';

            data.forEach(item => {
                province.innerHTML += `
                    <option value="${item.id}">
                        ${item.province_name}
                    </option>`;
            });

        });

});

// Municipality
document.getElementById('present_address_province')
.addEventListener('change', function () {

    let provinceId = this.value;

    fetch('/get-municipalities/' + provinceId)
        .then(res => res.json())
        .then(data => {

            let municipality =
                document.getElementById('present_address_municipality');

            municipality.innerHTML =
                '<option value="">Select Municipality</option>';

            data.forEach(item => {
                municipality.innerHTML += `
                    <option value="${item.id}">
                        ${item.municipality_name}
                    </option>`;
            });

        });

});

// Barangay
document.getElementById('present_address_municipality')
.addEventListener('change', function () {

    let municipalityId = this.value;

    fetch('/get-barangays/' + municipalityId)
        .then(res => res.json())
        .then(data => {

            let barangay =
                document.getElementById('present_address_barangay');

            barangay.innerHTML =
                '<option value="">Select Barangay</option>';

            data.forEach(item => {
                barangay.innerHTML += `
                    <option value="${item.id}">
                        ${item.barangay_name}
                    </option>`;
            });

        });

});

document.querySelector('[name="sex_id_personnel_fk"]')
.addEventListener('change', function () {
    console.log("SEX VALUE:", this.value);
});

document.querySelector('[name="civil_status_id_personnel_fk"]')
.addEventListener('change', function () {
    console.log("CIVIL STATUS VALUE:", this.value);
});

});