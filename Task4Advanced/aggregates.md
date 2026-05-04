# Агрегаты по ограниченным контекстам

## 1. Customer Context

### Агрегат Customer
- **Границы:** мастер-данные клиента (независимо от его роли: пациент, заёмщик).
- **Корень:** Customer (ID, fullName, birthDate, email, phone, status).
- **Инварианты:** уникальный email/phone в рамках контекста; обязательное наличие идентифицирующих данных.
- **Ключ:** customerId.

## 2. Medical Context

### Агрегат Patient (пациент)
- **Границы:** медицинский профиль пациента, создаваемый при первом обращении.
- **Корень:** Patient (patientId, customerId, registeredAt, bloodType, allergies).
- **Инварианты:** привязан к существующему customerId в Customer Context.

### Агрегат MedicalRecord (медицинская запись)
- **Границы:** история болезни одного обращения (encounter).
- **Корень:** MedicalRecord (recordId, patientId, doctorId, date, diagnosisCode, prescriptions[]).
- **Инварианты:** не может существовать без пациента, изменение диагноза возможно только до подтверждения.

### Агрегат Prescription (назначение)
- **Границы:** выписанные лекарства/процедуры.
- **Корень:** Prescription (prescriptionId, recordId, drugCode, dosage, issuedAt).

## 3. Fintech Context

### Агрегат CreditAgreement (кредитный договор)
- **Границы:** полная информация о кредите.
- **Корень:** CreditAgreement (agreementId, customerId, amount, rate, status, createdAt).
- **Инварианты:** активный кредит не может быть дублирован для одного клиента без погашения предыдущего.

### Агрегат Account (финансовый счёт)
- **Границы:** счёт клиента в финтех-системе.
- **Корень:** Account (accountId, customerId, balance, openedAt, type).

## 4. AI Context

### Агрегат AnalysisTask (задача анализа)
- **Границы:** заявка на обработку ИИ (например, анализ снимка).
- **Корень:** AnalysisTask (taskId, patientId, modelId, status, requestedAt, completedAt, resultReference).
- **Инварианты:** статус меняется по чёткому жизненному циклу (Requested → Processing → Completed/Failed).

### Агрегат AIModel (модель машинного обучения)
- **Границы:** версионированная модель.
- **Корень:** AIModel (modelId, version, trainingDate, accuracy, storagePath).