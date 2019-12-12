const db = require("../data/db-config.js");

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};

function find() {
    return db("schemes");
}

function findById(id) {
    return db("schemes")
        .where({ id })
        .first();
}

function findSteps(id) {
    console.log(id);
    return db("steps")
        .where({ scheme_id: id })
}

function add(scheme) {
    return db("schemes")
        .insert(scheme, "id")
        .then(ids => {
            const [id] = ids;

            return findById(id);
        });
}

function update(changes, id) {
    return db("schemes")
        .update(changes)
        .where({ id })
}

function remove(id) {
    return db("schemes")
        .where({ id })
        .del()
}