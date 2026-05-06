# Каталог доменных событий (минимальные контракты в Avro-подобном представлении)

Все события имеют общий атрибут `eventId`, `timestamp`, `sourceContext`.

## Customer Context
| Событие               | Контекст-источник | Семантика                                  | Ключевые поля                                 |
|-----------------------|-------------------|--------------------------------------------|-----------------------------------------------|
| CustomerCreated       | Customer          | Новый клиент зарегистрирован               | customerId, fullName, birthDate, email        |
| CustomerUpdated       | Customer          | Изменены мастер-данные клиента             | customerId, changedFields                     |

## Medical Context
| Событие               | Контекст-источник | Семантика                                  | Ключевые поля                                 |
|-----------------------|-------------------|--------------------------------------------|-----------------------------------------------|
| PatientRegistered     | Medical           | Пациент впервые заведён в клинике          | patientId, customerId                         |
| DiagnosisRecorded     | Medical           | Поставлен диагноз по обращению             | recordId, patientId, diagnosisCode, doctorId  |
| PrescriptionIssued    | Medical           | Выписано назначение                        | prescriptionId, recordId, drugCode, dosage    |
| MedicalTestCompleted  | Medical           | Завершено лабораторное/инструментальное исследование | testId, patientId, testType, resultSummary |

## Fintech Context
| Событие               | Контекст-источник | Семантика                                  | Ключевые поля                                 |
|-----------------------|-------------------|--------------------------------------------|-----------------------------------------------|
| CreditAgreementCreated| Fintech           | Открыт новый кредитный договор             | agreementId, customerId, amount, rate         |
| PaymentReceived       | Fintech           | Поступил платёж по кредиту                 | paymentId, agreementId, amount, timestamp     |
| AccountOpened         | Fintech           | Открыт финансовый счёт                     | accountId, customerId, type                   |

## AI Context
| Событие               | Контекст-источник | Семантика                                  | Ключевые поля                                 |
|-----------------------|-------------------|--------------------------------------------|-----------------------------------------------|
| AnalysisRequested     | AI               | Запрошен ИИ-анализ медицинских данных       | taskId, patientId, modelId, dataReference      |
| AnalysisCompleted     | AI               | Анализ успешно завершён                    | taskId, resultReference, confidence, completedAt|
| ModelTrained          | AI               | Обучена новая версия модели                | modelId, version, accuracy, trainingDate       |

**Минимальный контракт:** все события регистрируются в Schema Registry, используют обратную совместимость. Потребители могут использовать эволюционирующие схемы.