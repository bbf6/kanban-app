Color.create!([
  { hex: '6D2E46' },
  { hex: 'A26769' },
  { hex: 'D5B9B2' },
  { hex: 'ECE2D0' },
  { hex: '2E6E3B' },
  { hex: '6DA368' },
  { hex: 'B4D6C1' },
  { hex: 'D1EDD6' },
  { hex: '2E5B6E' },
  { hex: '687DA3' },
  { hex: 'B4D2D6' },
  { hex: 'D1E5ED' },
  { hex: '6E2E53' },
  { hex: 'A168A3' },
  { hex: 'D6D3B4' },
  { hex: 'EAD1ED' },
  { hex: '4E4E4E' },
  { hex: 'D5D5D5' },
  { hex: 'A38568' },
  { hex: '6E3E2E' }
])

Company.create!([
  { name: 'Array technologies', description: "Don't look for us online, we are no linked" },
  { name: 'Thompson & Company', description: 'If you get the reference, we can be friends' },
  { name: 'Skeleton Inc.', description: "Don't ask, just shake it!" }
])

PASSWORD = '$2a$12$dBN5dH6/i5uLuSSZuLkyv.E82v7LDCOal/OPYyTdeY2674wV9UBf6'

User.create!([
  { name: 'Adriana', last_name: 'Silva', nickname: nil, email: 'adriana@mail.com', password_digest: PASSWORD, admin: true, company: 1 },
  { name: 'Carmen', last_name: 'Rojas', nickname: 'Carmelita', email: 'carmen@mail.com', password_digest: PASSWORD, admin: false, company: 1 },
  { name: 'Ricardo', last_name: 'Flores', nickname: nil, email: 'ricardo@mail.com', password_digest: PASSWORD, admin: false, company: 1 },
  { name: 'Andrés', last_name: 'Herrera', nickname: 'ShadowSlayer69', email: 'andres@mail.com', password_digest: PASSWORD, admin: false, company: 1 },
  { name: 'Christopher', last_name: 'Andersen', nickname: 'chrisamazing', email: 'christopher@mail.com', password_digest: PASSWORD, admin: false, company: 1 },
  { name: 'Emily', last_name: 'Clark', nickname: '', email: 'emily@mail.com', password_digest: PASSWORD, admin: false, company: 1 },
  { name: 'Jessica', last_name: 'Lee', nickname: 'jess_lee', email: 'jessica@mail.com', password_digest: PASSWORD, admin: false, company: 1 },
  { name: 'Laura', last_name: 'Krüger', nickname: nil, email: 'laura@mail.com', password_digest: PASSWORD, admin: true, company: 2 },
  { name: 'Hanna', last_name: 'Meller', nickname: 'hanna', email: 'hanna@mail.com', password_digest: PASSWORD, admin: false, company: 2 },
  { name: 'José', last_name: 'Martínez', nickname: 'pepe', email: 'jose@mail.com', password_digest: PASSWORD, admin: false, company: 2 },
  { name: 'Willam', last_name: 'Miller', nickname: 'will', email: 'william@mail.com', password_digest: PASSWORD, admin: false, company: 2 },
  { name: 'Sophia', last_name: 'Yoon', nickname: nil, email: 'sophia@mail.com', password_digest: PASSWORD, admin: false, company: 2 },
  { name: 'Amanda', last_name: 'Walker', nickname: nil, email: 'amanda@mail.com', password_digest: PASSWORD, admin: false, company: 2 },
  { name: 'Tim', last_name: 'Becker', nickname: 'tim', email: 'tim@mail.com', password_digest: PASSWORD, admin: false, company: 2 },
  { name: 'Jan', last_name: 'Koch', nickname: nil, email: 'jan@mail.com', password_digest: PASSWORD, admin: false, company: 2 },
  { name: 'Mia', last_name: 'Wolf', nickname: nil, email: 'mia@mail.com', password_digest: PASSWORD, admin: true, company: 3 },
  { name: 'Jonas', last_name: 'Wagner', nickname: nil, email: 'jonas@mail.com', password_digest: PASSWORD, admin: false, company: 3 },
  { name: 'Isabel', last_name: 'Romero', nickname: nil, email: 'isabel@mail.com', password_digest: PASSWORD, admin: false, company: 3 },
  { name: 'Elena', last_name: 'Mendoza', nickname: nil, email: 'elena@mail.com', password_digest: PASSWORD, admin: false, company: 3 },
  { name: 'Ana', last_name: 'Fernandez', nickname: nil, email: 'ana@mail.com', password_digest: PASSWORD, admin: false, company: 3 },
])
