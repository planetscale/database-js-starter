import { connect } from '@planetscale/database'
import dotenv from 'dotenv'
import express from 'express'

dotenv.config()
const app = express()
app.use(express.json())

const config = {
  host: process.env.DATABASE_HOST,
  username: process.env.DATABASE_USERNAME,
  password: process.env.DATABASE_PASSWORD,
}
const conn = await connect(config)

app.get('/', async (req, res) => {
  const results = await conn.execute("SELECT * FROM hotels")
  console.log(results)
  res.json(results.rows)
})

// add endpoint to retrieve a single hotel
app.get('/:id', async (req, res) => {
  const results = await conn.execute("SELECT * FROM hotels WHERE id = ?", [req.params.id])
  console.log(results)
  // if no results, return 404
  if (results.rows.length === 0) {
    res.status(404).send()
    return
  }
  // return the first row
  res.json(results.rows[0])
})

app.post('/', async (req, res) => {
  const query = "INSERT INTO hotels (`name`, `address`, `stars`) VALUES (:name, :address, :stars)"
  const params = {
    name: req.body.name,
    address: req.body.address,
    stars: req.body.stars
  }
  const results = await conn.execute(query, params)
  console.log(results)
  res.json({
    id: results.insertId,
    name: req.body.name,
    address: req.body.address,
    stars: req.body.stars
  })
})

app.put('/:id', async (req, res) => {
  const query = "UPDATE hotels set `name`=:name, `address`=:address, `stars`=:stars WHERE `id`=:id"
  const params = {
    id: req.params.id,
    name: req.body.name,
    address: req.body.address,
    stars: req.body.stars
  }
  const results = await conn.execute(query, params)
  // check if hotel exists
  if (results.rowsAffected != 1) {
    res.status(404).send()
    return
  }
  console.log(results)
  res.status(200).send()
})

app.delete("/:id", async (req, res) => {
  const query = "DELETE FROM hotels WHERE `id`=:id"
  const params = {
    id: req.params.id,
    name: req.body.name,
    address: req.body.address,
    stars: req.body.stars
  }
  const results = await conn.execute(query, params)
  // check if a row was deleted
  if (results.rowsAffected != 1) {
    res.status(404).send()
    return
  }

  console.log(results)
  res.status(200).send()
})

const port = process.env.PORT || 3000

app.listen(port, () => {
  console.log(`API running on http://localhost:${port}`)
})
