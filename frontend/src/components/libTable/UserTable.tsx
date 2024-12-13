import React, { useState } from 'react';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Button } from '@mui/material';
import { UserData } from '../structs';
import { deleteUser } from '../api/DatabaseAPI';

interface Props {
  users: UserData[];
  updateUsers: () => void;
}

export function UserTable({ users, updateUsers }: Props) {
  const deleteCallback = async (username: string) => {
    await deleteUser(username)
    updateUsers()
  }

  return (
    <TableContainer component={Paper}>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell>User ID</TableCell>
            <TableCell>User Name</TableCell>
            <TableCell>User Password</TableCell>
            <TableCell>Actions</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {users.map((user) => (
            <TableRow key={user.username}>
              <TableCell>{user.username}</TableCell>
              <TableCell>
                <PasswordCell password={user.password} />
              </TableCell>
              <TableCell>
                <Button onClick={() => deleteCallback(user.username)} variant="contained" color="primary">
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
      style={{ cursor: 'pointer' }}
    >
      {showPassword ? password : '••••••••'}
    </span>
  );
};
