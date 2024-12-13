import React, { useEffect, useState } from 'react';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Button } from '@mui/material';
import { UserData, BookLoan } from '../structs';
import { deleteUser, getLoans, returnBook } from '../api/DatabaseAPI';

interface Props {
  users: UserData[];
  updateUsers: () => void;
}

export function UserTable({ users, updateUsers }: Props) {
  const [bookLoans, setBookLoans] = useState<BookLoan[]>([]);

  const fetchLoans = async () => {
    const loans = await getLoans();
    setBookLoans(loans);
  };

  useEffect(() => {
    fetchLoans();
  }, []);

  const deleteCallback = async (username: string) => {
    try {
      bookLoans.filter(loan =>
        loan.user_name == username
      ).map(async loan => await returnBook(loan.book_id));

      fetchLoans()

      await deleteUser(username);
      updateUsers();
    } catch (error) {
      console.error('Error deleting user:', error);
      // You could show an error notification here
    }
  };

  return (
    <TableContainer component={Paper}>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell>User Name</TableCell>
            <TableCell>User Password</TableCell>
            <TableCell>Actions</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {users.filter(user => user.user_name != sessionStorage.getItem('userName')).map((user) => (
            <TableRow key={user.user_name}>
              <TableCell>{user.user_name}</TableCell>
              <TableCell>
                <PasswordCell password={user.user_password} />
              </TableCell>
              <TableCell>
                <Button
                  onClick={() => deleteCallback(user.user_name)}
                  variant="contained"
                  color="primary"
                  aria-label={`Delete user ${user.user_name}`}
                >
                  Delete
                </Button>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

const PasswordCell: React.FC<{ password: string }> = ({ password }) => {
  const [showPassword, setShowPassword] = useState(false);

  return (
    <span
      onMouseEnter={() => setShowPassword(true)}
      onMouseLeave={() => setShowPassword(false)}
      onFocus={() => setShowPassword(true)}  // Allow keyboard users to toggle
      onBlur={() => setShowPassword(false)}  // Allow keyboard users to toggle
      style={{ cursor: 'pointer' }}
      aria-label={showPassword ? password : 'Click to reveal password'}
    >
      {showPassword ? password : '••••••••'}
    </span>
  );
};
