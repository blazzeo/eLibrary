import { useState } from 'react'
import searchBar from './searchBar'

export default function library() {
  const [user, setUser] = useState();

  return (
    <div>
      <searchBar />
    </div>
  )
}
