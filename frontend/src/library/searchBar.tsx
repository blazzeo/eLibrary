import { useState } from 'react'

export default function searchBar() {
  const [searchPrompt, setPrompt] = useState('');

  function search() {

  }

  return (
    <div className='searchBar'>
      <input type="search" className='searchText' placeholder='Search'/>
      <input type="button" className='searchButton'/>
    </div>
  )
}
