import { useState } from 'react'
import SearchBar from './searchBar'

export default function library() {
  const [user, setUser] = useState();

  return (
    <div>
      <SearchBar />
    </div>
  )
}
