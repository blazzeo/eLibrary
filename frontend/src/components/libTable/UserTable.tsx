import React, { useState } from 'react';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Button } from '@mui/material';

interface User {
  user_id: number;
  user_name: string;
  user_password: string;
}

const users: User[] = [
  { user_id: 1, user_name: 'Alice', user_password: 'password123' },
  { user_id: 2, user_name: 'Bob', user_password: 'qwerty' },
  { user_id: 3, user_name: 'Charlie', user_password: 'abc123' },
];

const UserTable: React.FC = () => {
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
            <TableRow key={user.user_id}>
              <TableCell>{user.user_id}</TableCell>
              <TableCell>{user.user_name}</TableCell>
              <TableCell>
                <PasswordCell password={user.user_password} />
              </TableCell>
              <TableCell>
                <Button variant="contained" color="primary">
                  Action 1
                </Button>
                <Button variant="contained" color="secondary">
                  Action 2
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

export default UserTable;
