/* DESTROY SCRIPT */
DELETE FROM VOTE;
DELETE FROM QUESTION_TAG;
DELETE FROM RELATED_TAGS;
DELETE FROM TAG;
DELETE FROM ANSWER;
DELETE FROM QUESTION;
DELETE FROM CONTENT;
DELETE FROM MEDUSER;

/* USERS */
-- Dates from 05 oct 2023. One the first day, two the next...
INSERT INTO MEDUSER (USERNAME, CREATED) VALUES
    ('jkutkut', '2023-10-05'),
    ('jane_doe', '2023-10-06'),
    ('john_smith', '2023-10-06'),
    ('samuel_white', '2023-10-07'),
    ('jennifer_clark', '2023-10-07'),
    ('daniel_lee', '2023-10-07'),
    ('michael_brown', '2023-10-08'),
    ('elizabeth_turner', '2023-10-08'),
    ('sophia_hall', '2023-10-08'),
    ('sarah_clark', '2023-10-08'),
    ('oliver_adams', '2023-10-09'),
    ('natalie_smith', '2023-10-09'),
    ('william_miller', '2023-10-09'),
    ('sophia_davis', '2023-10-09'),
    ('thomas_johnson', '2023-10-10'),
    ('grace_martin', '2023-10-10'),
    ('richard_adams', '2023-10-10'),
    ('robert_harris', '2023-10-10'),
    ('anna_miller', '2023-10-11'),
    ('david_brown', '2023-10-11'),
    ('michael_wilson', '2023-10-11'),
    ('emily_turner', '2023-10-11');

/* TAGS */
INSERT INTO TAG (NAME, DESCRIPTION) VALUES
    ('Cardiology', 'Deals with heart-related disorders and diseases'),
    ('Orthopedics', 'Focuses on musculoskeletal system and bone disorders'),
    ('Dermatology', 'Specializes in skin-related conditions and diseases'),
    ('Gastroenterology', 'Concerned with digestive system disorders'),
    ('Neurology', 'Treats disorders of the nervous system'),
    ('Ophthalmology', 'Deals with eye diseases and vision problems'),
    ('Obstetrics', 'Focuses on pregnancy and childbirth'),
    ('Oncology', 'Specializes in the treatment of cancer'),
    ('Pediatrics', 'Focuses on medical care for children'),
    ('Urology', 'Deals with urinary tract and male reproductive system disorders'),
    ('Psychiatry', 'Treats mental health disorders'),
    ('Rheumatology', 'Specializes in autoimmune and musculoskeletal disorders'),
    ('Endocrinology', 'Focuses on hormone-related disorders'),
    ('Pulmonology', 'Deals with respiratory system disorders'),
    ('Nephrology', 'Concerned with kidney diseases and disorders');

/* QUESTIONS */
-- Cardiology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'How to Maintain a Healthy Heart',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'john_smith'),
        '2023-10-06'
    ),
    (
        'Understanding Heart Palpitations',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sarah_clark'),
        '2023-10-08'
    ),
    (
        'Diet Tips for Cardiac Health',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'richard_adams'),
        '2023-10-10'
    ),
    (
        'Dealing with High Blood Pressure',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'anna_miller'),
        '2023-10-07'
    ),
    (
        'Cardiac Rehabilitation Programs',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'emily_turner'),
        '2023-10-11'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'How to Maintain a Healthy Heart'),
        (SELECT ID FROM TAG WHERE NAME = 'Cardiology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Understanding Heart Palpitations'),
        (SELECT ID FROM TAG WHERE NAME = 'Cardiology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Diet Tips for Cardiac Health'),
        (SELECT ID FROM TAG WHERE NAME = 'Cardiology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Dealing with High Blood Pressure'),
        (SELECT ID FROM TAG WHERE NAME = 'Cardiology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Cardiac Rehabilitation Programs'),
        (SELECT ID FROM TAG WHERE NAME = 'Cardiology')
    );

-- Orthopedics
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Common Causes of Joint Pain',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'david_brown'),
        '2023-10-05'
    ),
    (
        'Recovery After Knee Surgery',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'anna_miller'),
        '2023-10-06'
    ),
    (
        'Treatment Options for Osteoarthritis',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'robert_harris'),
        '2023-10-09'
    ),
    (
        'Preventing Sports-Related Injuries',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'grace_martin'),
        '2023-10-11'
    ),
    (
        'Physical Therapy for Orthopedic Conditions',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'samuel_white'),
        '2023-10-12'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Common Causes of Joint Pain'),
        (SELECT ID FROM TAG WHERE NAME = 'Orthopedics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Recovery After Knee Surgery'),
        (SELECT ID FROM TAG WHERE NAME = 'Orthopedics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Treatment Options for Osteoarthritis'),
        (SELECT ID FROM TAG WHERE NAME = 'Orthopedics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Preventing Sports-Related Injuries'),
        (SELECT ID FROM TAG WHERE NAME = 'Orthopedics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Physical Therapy for Orthopedic Conditions'),
        (SELECT ID FROM TAG WHERE NAME = 'Orthopedics')
    );

-- Dermatology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Skincare Tips for Acne-Prone Skin',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'jennifer_clark'),
        '2023-10-05'
    ),
    (
        'Managing Eczema Flare-Ups',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'elizabeth_turner'),
        '2023-10-06'
    ),
    (
        'Choosing the Right Sunscreen',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'daniel_lee'),
        '2023-10-08'
    ),
    (
        'Common Skin Allergies',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sophia_hall'),
        '2023-10-09'
    ),
    (
        'Treating Psoriasis: What Works Best?',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'oliver_adams'),
        '2023-10-12'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Skincare Tips for Acne-Prone Skin'),
        (SELECT ID FROM TAG WHERE NAME = 'Dermatology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Managing Eczema Flare-Ups'),
        (SELECT ID FROM TAG WHERE NAME = 'Dermatology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Choosing the Right Sunscreen'),
        (SELECT ID FROM TAG WHERE NAME = 'Dermatology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Common Skin Allergies'),
        (SELECT ID FROM TAG WHERE NAME = 'Dermatology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Treating Psoriasis: What Works Best?'),
        (SELECT ID FROM TAG WHERE NAME = 'Dermatology')
    );

-- Gastroenterology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Managing Irritable Bowel Syndrome',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'natalie_smith'),
        '2023-10-05'
    ),
    (
        'Understanding Crohn''s Disease',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'thomas_johnson'),
        '2023-10-06'
    ),
    (
        'Healthy Eating for a Happy Gut',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sophia_davis'),
        '2023-10-08'
    ),
    (
        'Liver Health and Its Importance',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sophia_davis'),
        '2023-10-10'
    ),
    (
        'Colon Cancer Screening Guidelines',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'emily_turner'),
        '2023-10-11'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Managing Irritable Bowel Syndrome'),
        (SELECT ID FROM TAG WHERE NAME = 'Gastroenterology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Understanding Crohn''s Disease'),
        (SELECT ID FROM TAG WHERE NAME = 'Gastroenterology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Healthy Eating for a Happy Gut'),
        (SELECT ID FROM TAG WHERE NAME = 'Gastroenterology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Liver Health and Its Importance'),
        (SELECT ID FROM TAG WHERE NAME = 'Gastroenterology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Colon Cancer Screening Guidelines'),
        (SELECT ID FROM TAG WHERE NAME = 'Gastroenterology')
    );

-- Neurology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Living with Multiple Sclerosis',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'david_brown'),
        '2023-10-05'
    ),
    (
        'Migraine Management Strategies',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'anna_miller'),
        '2023-10-06'
    ),
    (
        'Understanding Parkinson''s Disease',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'robert_harris'),
        '2023-10-09'
    ),
    (
        'Epilepsy Treatment Options',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'grace_martin'),
        '2023-10-11'
    ),
    (
        'Neuropathy and Its Causes',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'samuel_white'),
        '2023-10-12'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Living with Multiple Sclerosis'),
        (SELECT ID FROM TAG WHERE NAME = 'Neurology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Migraine Management Strategies'),
        (SELECT ID FROM TAG WHERE NAME = 'Neurology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Understanding Parkinson''s Disease'),
        (SELECT ID FROM TAG WHERE NAME = 'Neurology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Epilepsy Treatment Options'),
        (SELECT ID FROM TAG WHERE NAME = 'Neurology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Neuropathy and Its Causes'),
        (SELECT ID FROM TAG WHERE NAME = 'Neurology')
    );

-- Ophthalmology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Choosing the Right Eyeglasses',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'jennifer_clark'),
        '2023-10-05'
    ),
    (
        'Cataracts: Symptoms and Surgery',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'elizabeth_turner'),
        '2023-10-06'
    ),
    (
        'Contact Lens Care Tips',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'daniel_lee'),
        '2023-10-08'
    ),
    (
        'Glaucoma: Diagnosis and Treatment',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sophia_hall'),
        '2023-10-09'
    ),
    (
        'Refractive Errors and Laser Eye Surgery',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'oliver_adams'),
        '2023-10-12'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Choosing the Right Eyeglasses'),
        (SELECT ID FROM TAG WHERE NAME = 'Ophthalmology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Cataracts: Symptoms and Surgery'),
        (SELECT ID FROM TAG WHERE NAME = 'Ophthalmology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Contact Lens Care Tips'),
        (SELECT ID FROM TAG WHERE NAME = 'Ophthalmology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Glaucoma: Diagnosis and Treatment'),
        (SELECT ID FROM TAG WHERE NAME = 'Ophthalmology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Refractive Errors and Laser Eye Surgery'),
        (SELECT ID FROM TAG WHERE NAME = 'Ophthalmology')
    );

-- Obstetrics
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Prenatal Nutrition for a Healthy Baby',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'natalie_smith'),
        '2023-10-05'
    ),
    (
        'Preparing for Childbirth: What to Expect',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'thomas_johnson'),
        '2023-10-06'
    ),
    (
        'Postpartum Care Tips for New Moms',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sophia_davis'),
        '2023-10-08'
    ),
    (
        'Choosing a Pediatrician for Your Baby',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'michael_wilson'),
        '2023-10-10'
    ),
    (
        'Breastfeeding: Benefits and Challenges',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'emily_turner'),
        '2023-10-11'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Prenatal Nutrition for a Healthy Baby'),
        (SELECT ID FROM TAG WHERE NAME = 'Obstetrics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Preparing for Childbirth: What to Expect'),
        (SELECT ID FROM TAG WHERE NAME = 'Obstetrics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Postpartum Care Tips for New Moms'),
        (SELECT ID FROM TAG WHERE NAME = 'Obstetrics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Choosing a Pediatrician for Your Baby'),
        (SELECT ID FROM TAG WHERE NAME = 'Obstetrics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Breastfeeding: Benefits and Challenges'),
        (SELECT ID FROM TAG WHERE NAME = 'Obstetrics')
    );

-- Oncology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Understanding Different Types of Cancer',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'david_brown'),
        '2023-10-05'
    ),
    (
        'Cancer Treatment Options and Side Effects',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'anna_miller'),
        '2023-10-06'
    ),
    (
        'Coping with a Cancer Diagnosis',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'robert_harris'),
        '2023-10-09'
    ),
    (
        'Cancer Prevention Strategies',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'grace_martin'),
        '2023-10-11'
    ),
    (
        'Support for Cancer Patients and Their Families',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'samuel_white'),
        '2023-10-12'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Understanding Different Types of Cancer'),
        (SELECT ID FROM TAG WHERE NAME = 'Oncology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Cancer Treatment Options and Side Effects'),
        (SELECT ID FROM TAG WHERE NAME = 'Oncology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Coping with a Cancer Diagnosis'),
        (SELECT ID FROM TAG WHERE NAME = 'Oncology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Cancer Prevention Strategies'),
        (SELECT ID FROM TAG WHERE NAME = 'Oncology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Support for Cancer Patients and Their Families'),
        (SELECT ID FROM TAG WHERE NAME = 'Oncology')
    );

-- Pediatrics
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Childhood Immunization Schedule',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'jennifer_clark'),
        '2023-10-05'
    ),
    (
        'Common Childhood Illnesses and Their Treatment',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'elizabeth_turner'),
        '2023-10-06'
    ),
    (
        'Healthy Eating for Kids',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'daniel_lee'),
        '2023-10-08'
    ),
    (
        'Child Safety Tips at Home and School',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sophia_hall'),
        '2023-10-09'
    ),
    (
        'Adolescent Mental Health Issues',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'oliver_adams'),
        '2023-10-12'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Childhood Immunization Schedule'),
        (SELECT ID FROM TAG WHERE NAME = 'Pediatrics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Common Childhood Illnesses and Their Treatment'),
        (SELECT ID FROM TAG WHERE NAME = 'Pediatrics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Healthy Eating for Kids'),
        (SELECT ID FROM TAG WHERE NAME = 'Pediatrics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Child Safety Tips at Home and School'),
        (SELECT ID FROM TAG WHERE NAME = 'Pediatrics')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Adolescent Mental Health Issues'),
        (SELECT ID FROM TAG WHERE NAME = 'Pediatrics')
    );

-- Urology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Kidney Stones: Causes and Treatment',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'natalie_smith'),
        '2023-10-05'
    ),
    (
        'Prostate Health: What Men Need to Know',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'natalie_smith'),
        '2023-10-06'
    ),
    (
        'Urinary Track Infections in Women',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sophia_davis'),
        '2023-10-08'
    ),
    (
        'Incontinence Management for Seniors',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'michael_wilson'),
        '2023-10-10'
    ),
    (
        'Bladder Cancer Awareness',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'emily_turner'),
        '2023-10-11'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Kidney Stones: Causes and Treatment'),
        (SELECT ID FROM TAG WHERE NAME = 'Urology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Prostate Health: What Men Need to Know'),
        (SELECT ID FROM TAG WHERE NAME = 'Urology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Urinary Track Infections in Women'),
        (SELECT ID FROM TAG WHERE NAME = 'Urology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Incontinence Management for Seniors'),
        (SELECT ID FROM TAG WHERE NAME = 'Urology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Bladder Cancer Awareness'),
        (SELECT ID FROM TAG WHERE NAME = 'Urology')
    );

-- Psychiatry
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Understanding Depression and Its Treatment',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'david_brown'),
        '2023-10-05'
    ),
    (
        'Anxiety Disorders: Signs and Coping Strategies',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'anna_miller'),
        '2023-10-06'
    ),
    (
        'Mental Health Stigma: Breaking the Silence',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'robert_harris'),
        '2023-10-09'
    ),
    (
        'Counseling and Therapy Options',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'grace_martin'),
        '2023-10-11'
    ),
    (
        'Medications for Mental Health Conditions',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'samuel_white'),
        '2023-10-12'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Understanding Depression and Its Treatment'),
        (SELECT ID FROM TAG WHERE NAME = 'Psychiatry')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Anxiety Disorders: Signs and Coping Strategies'),
        (SELECT ID FROM TAG WHERE NAME = 'Psychiatry')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Mental Health Stigma: Breaking the Silence'),
        (SELECT ID FROM TAG WHERE NAME = 'Psychiatry')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Counseling and Therapy Options'),
        (SELECT ID FROM TAG WHERE NAME = 'Psychiatry')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Medications for Mental Health Conditions'),
        (SELECT ID FROM TAG WHERE NAME = 'Psychiatry')
    );

-- Rheumatology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Living with Rheumatoid Arthritis',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'jennifer_clark'),
        '2023-10-05'
    ),
    (
        'Osteoarthritis: Causes and Management',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'elizabeth_turner'),
        '2023-10-06'
    ),
    (
        'Lupus: Symptoms and Treatment',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'daniel_lee'),
        '2023-10-08'
    ),
    (
        'Fibromyalgia: Coping with Chronic Pain',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sophia_hall'),
        '2023-10-09'
    ),
    (
        'Spondyloarthritis and Its Impact',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'oliver_adams'),
        '2023-10-12'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Living with Rheumatoid Arthritis'),
        (SELECT ID FROM TAG WHERE NAME = 'Rheumatology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Osteoarthritis: Causes and Management'),
        (SELECT ID FROM TAG WHERE NAME = 'Rheumatology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Lupus: Symptoms and Treatment'),
        (SELECT ID FROM TAG WHERE NAME = 'Rheumatology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Fibromyalgia: Coping with Chronic Pain'),
        (SELECT ID FROM TAG WHERE NAME = 'Rheumatology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Spondyloarthritis and Its Impact'),
        (SELECT ID FROM TAG WHERE NAME = 'Rheumatology')
    );

-- Endocrinology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Thyroid Disorders: Diagnosis and Treatment',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'natalie_smith'),
        '2023-10-05'
    ),
    (
        'Diabetes Management and Lifestyle',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'thomas_johnson'),
        '2023-10-06'
    ),
    (
        'Hormone Replacement Therapy for Menopause',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sophia_davis'),
        '2023-10-08'
    ),
    (
        'Adrenal Gland Disorders',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'michael_wilson'),
        '2023-10-10'
    ),
    (
        'Pituitary Disorders: What You Should Know',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'emily_turner'),
        '2023-10-11'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Thyroid Disorders: Diagnosis and Treatment'),
        (SELECT ID FROM TAG WHERE NAME = 'Endocrinology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Diabetes Management and Lifestyle'),
        (SELECT ID FROM TAG WHERE NAME = 'Endocrinology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Hormone Replacement Therapy for Menopause'),
        (SELECT ID FROM TAG WHERE NAME = 'Endocrinology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Adrenal Gland Disorders'),
        (SELECT ID FROM TAG WHERE NAME = 'Endocrinology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Pituitary Disorders: What You Should Know'),
        (SELECT ID FROM TAG WHERE NAME = 'Endocrinology')
    );

-- Pulmonology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Asthma: Symptoms and Inhaler Use',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'david_brown'),
        '2023-10-05'
    ),
    (
        'COPD: Causes and Breathing Exercises',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'anna_miller'),
        '2023-10-06'
    ),
    (
        'Lung Cancer Screening and Prevention',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'robert_harris'),
        '2023-10-09'
    ),
    (
        'Sleep Apnea: Diagnosis and CPAP Therapy',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'grace_martin'),
        '2023-10-11'
    ),
    (
        'Managing Allergies and Respiratory Conditions',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'samuel_white'),
        '2023-10-12'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Asthma: Symptoms and Inhaler Use'),
        (SELECT ID FROM TAG WHERE NAME = 'Pulmonology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'COPD: Causes and Breathing Exercises'),
        (SELECT ID FROM TAG WHERE NAME = 'Pulmonology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Lung Cancer Screening and Prevention'),
        (SELECT ID FROM TAG WHERE NAME = 'Pulmonology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Sleep Apnea: Diagnosis and CPAP Therapy'),
        (SELECT ID FROM TAG WHERE NAME = 'Pulmonology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Managing Allergies and Respiratory Conditions'),
        (SELECT ID FROM TAG WHERE NAME = 'Pulmonology')
    );

-- Nephrology
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    (
        'Kidney Function and Your Health',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'jennifer_clark'),
        '2023-10-05'
    ),
    (
        'Chronic Kidney Disease: Stages and Management',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'elizabeth_turner'),
        '2023-10-06'
    ),
    (
        'Hemodialysis vs. Peritoneal Dialysis',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'daniel_lee'),
        '2023-10-08'
    ),
    (
        'Transplantation: Kidney Donor and Recipient Information',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'sophia_hall'),
        '2023-10-09'
    ),
    (
        'Hydration and Kidney Health',
        (SELECT ID FROM MEDUSER WHERE USERNAME = 'oliver_adams'),
        '2023-10-12'
    );

INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Kidney Function and Your Health'),
        (SELECT ID FROM TAG WHERE NAME = 'Nephrology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Chronic Kidney Disease: Stages and Management'),
        (SELECT ID FROM TAG WHERE NAME = 'Nephrology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Hemodialysis vs. Peritoneal Dialysis'),
        (SELECT ID FROM TAG WHERE NAME = 'Nephrology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Transplantation: Kidney Donor and Recipient Information'),
        (SELECT ID FROM TAG WHERE NAME = 'Nephrology')
    ),
    (
        (SELECT ID FROM QUESTION WHERE TITLE = 'Hydration and Kidney Health'),
        (SELECT ID FROM TAG WHERE NAME = 'Nephrology')
    );

/* CONTENT */
-- Cardiology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'How to Maintain a Healthy Heart'),
        'I was wondering if anyone had any tips for maintaining a healthy heart. I''m in my 40s and I''m starting to worry about my heart health. I''ve heard that diet and exercise are important, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Understanding Heart Palpitations'),
        'I''ve been experiencing heart palpitations lately and I''m not sure what to do. I''ve been under a lot of stress lately, so I''m wondering if that could be the cause. I''ve also been drinking a lot of coffee, so maybe that''s the problem. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Diet Tips for Cardiac Health'),
        'I''m looking for some diet tips to improve my cardiac health. I''ve been eating a lot of junk food lately and I''m worried about my heart health. I''ve heard that eating more fruits and vegetables can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Dealing with High Blood Pressure'),
        'I''ve been diagnosed with high blood pressure and I''m not sure what to do. I''ve been taking medication for it, but I''m not sure if it''s working. I''ve also been trying to eat healthier and exercise more, but I''m not sure if that''s helping either. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Cardiac Rehabilitation Programs'),
        'I''m looking for some information on cardiac rehabilitation programs. I''ve been diagnosed with heart disease and I''m not sure what to do. I''ve heard that cardiac rehab can help, but I''m not sure where to start. Any advice would be appreciated!'
    );

-- Orthopedics
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Common Causes of Joint Pain'),
        'I''ve been experiencing joint pain lately and I''m not sure what to do. I''ve been under a lot of stress lately, so I''m wondering if that could be the cause. I''ve also been exercising a lot, so maybe that''s the problem. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Recovery After Knee Surgery'),
        'I''m recovering from knee surgery and I''m not sure what to do. I''ve been doing physical therapy, but I''m not sure if it''s helping. I''ve also been taking pain medication, but I''m not sure if that''s helping either. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Treatment Options for Osteoarthritis'),
        'I''m looking for some treatment options for osteoarthritis. I''ve been diagnosed with it and I''m not sure what to do. I''ve heard that physical therapy can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Preventing Sports-Related Injuries'),
        'I''m looking for some tips on preventing sports-related injuries. I''ve been playing a lot of sports lately and I''m worried about getting injured. I''ve heard that stretching can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Physical Therapy for Orthopedic Conditions'),
        'I''m looking for some information on physical therapy for orthopedic conditions. I''ve been diagnosed with a knee injury and I''m not sure what to do. I''ve heard that physical therapy can help, but I''m not sure where to start. Any advice would be appreciated!'
    );

-- Dermatology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Skincare Tips for Acne-Prone Skin'),
        'I''m looking for some skincare tips for acne-prone skin. I''ve been dealing with acne for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Managing Eczema Flare-Ups'),
        'I''m looking for some tips on managing eczema flare-ups. I''ve been dealing with eczema for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Choosing the Right Sunscreen'),
        'I''m looking for some tips on choosing the right sunscreen. I''ve been dealing with sunburns for a while now and I''m not sure what to do. I''ve heard that sunscreen can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Common Skin Allergies'),
        'I''m looking for some information on common skin allergies. I''ve been dealing with allergies for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Treating Psoriasis: What Works Best?'),
        'I''m looking for some information on treating psoriasis. I''ve been dealing with psoriasis for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    );

-- Gastroenterology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Managing Irritable Bowel Syndrome'),
        'I''m looking for some tips on managing irritable bowel syndrome. I''ve been dealing with IBS for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Understanding Crohn''s Disease'),
        'I''m looking for some information on Crohn''s disease. I''ve been diagnosed with it and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Healthy Eating for a Happy Gut'),
        'I''m looking for some tips on healthy eating for a happy gut. I''ve been dealing with digestive issues for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Liver Health and Its Importance'),
        'I''m looking for some information on liver health. I''ve been diagnosed with liver disease and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Colon Cancer Screening Guidelines'),
        'I''m looking for some information on colon cancer screening guidelines. I''ve been diagnosed with colon cancer and I''m not sure what to do. I''ve heard that screening can help, but I''m not sure where to start. Any advice would be appreciated!'
    );

-- Neurology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Living with Multiple Sclerosis'),
        'I''m looking for some information on living with multiple sclerosis. I''ve been diagnosed with MS and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Migraine Management Strategies'),
        'I''m looking for some information on migraine management strategies. I''ve been dealing with migraines for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Understanding Parkinson''s Disease'),
        'I''m looking for some information on Parkinson''s disease. I''ve been diagnosed with it and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Epilepsy Treatment Options'),
        'I''m looking for some information on epilepsy treatment options. I''ve been diagnosed with epilepsy and I''m not sure what to do. I''ve heard that medication can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Neuropathy and Its Causes'),
        'I''m looking for some information on neuropathy. I''ve been diagnosed with it and I''m not sure what to do. I''ve heard that medication can help, but I''m not sure where to start. Any advice would be appreciated!'
    );

-- Ophthalmology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Choosing the Right Eyeglasses'),
        'I''m looking for some information on choosing the right eyeglasses. I''ve been diagnosed with nearsightedness and I''m not sure what to do. I''ve heard that glasses can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Cataracts: Symptoms and Surgery'),
        'I''m looking for some information on cataracts. I''ve been diagnosed with them and I''m not sure what to do. I''ve heard that surgery can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Contact Lens Care Tips'),
        'I''m looking for some information on contact lens care tips. I''ve been wearing contacts for a while now and I''m not sure what to do. I''ve heard that cleaning them can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Glaucoma: Diagnosis and Treatment'),
        'I''m looking for some information on glaucoma. I''ve been diagnosed with it and I''m not sure what to do. I''ve heard that medication can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Refractive Errors and Laser Eye Surgery'),
        'I''m looking for some information on refractive errors. I''ve been diagnosed with them and I''m not sure what to do. I''ve heard that laser eye surgery can help, but I''m not sure where to start. Any advice would be appreciated!'
    );

-- Obstetrics
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Prenatal Nutrition for a Healthy Baby'),
        'I''m looking for some information on prenatal nutrition. I''m pregnant and I''m not sure what to do. I''ve heard that eating healthy can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Preparing for Childbirth: What to Expect'),
        'I''m looking for some information on preparing for childbirth. I''m pregnant and I''m not sure what to do. I''ve heard that taking childbirth classes can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Postpartum Care Tips for New Moms'),
        'I''m looking for some information on postpartum care tips. I''m a new mom and I''m not sure what to do. I''ve heard that eating healthy and exercising can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Choosing a Pediatrician for Your Baby'),
        'I''m looking for some information on choosing a pediatrician. I''m a new mom and I''m not sure what to do. I''ve heard that asking friends and family for recommendations can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Breastfeeding: Benefits and Challenges'),
        'I''m looking for some information on breastfeeding. I''m a new mom and I''m not sure what to do. I''ve heard that breastfeeding can help with bonding and immunity, but I''m not sure where to start. Any advice would be appreciated!'
    );

-- Oncology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Understanding Different Types of Cancer'),
        'I''m looking for some information on different types of cancer. I''ve been diagnosed with cancer and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Cancer Treatment Options and Side Effects'),
        'I''m looking for some information on cancer treatment options. I''ve been diagnosed with cancer and I''m not sure what to do. I''ve heard that chemotherapy can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Coping with a Cancer Diagnosis'),
        'I''m looking for some information on coping with a cancer diagnosis. I''ve been diagnosed with cancer and I''m not sure what to do. I''ve heard that talking to friends and family can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Cancer Prevention Strategies'),
        'I''m looking for some information on cancer prevention strategies. I''ve been diagnosed with cancer and I''m not sure what to do. I''ve heard that eating healthy and exercising can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Support for Cancer Patients and Their Families'),
        'I''m looking for some information on support for cancer patients and their families. I''ve been diagnosed with cancer and I''m not sure what to do. I''ve heard that talking to friends and family can help, but I''m not sure where to start. Any advice would be appreciated!'
    );

-- Pediatrics
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Childhood Immunization Schedule'),
        'I''m looking for some information on childhood immunization schedules. I''m a new parent and I''m not sure what to do. I''ve heard that talking to my pediatrician can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Common Childhood Illnesses and Their Treatment'),
        'I''m looking for some information on common childhood illnesses. I''m a new parent and I''m not sure what to do. I''ve heard that talking to my pediatrician can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Healthy Eating for Kids'),
        'I''m looking for some information on healthy eating for kids. I''m a new parent and I''m not sure what to do. I''ve heard that talking to my pediatrician can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Child Safety Tips at Home and School'),
        'I''m looking for some information on child safety tips. I''m a new parent and I''m not sure what to do. I''ve heard that talking to my pediatrician can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Adolescent Mental Health Issues'),
        'I''m looking for some information on adolescent mental health issues. I''m a new parent and I''m not sure what to do. I''ve heard that talking to my pediatrician can help, but I''m not sure where to start. Any advice would be appreciated!'
    );

-- Urology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Kidney Stones: Causes and Treatment'),
        'I''m looking for some information on kidney stones. I''ve been diagnosed with them and I''m not sure what to do. I''ve heard that drinking more water can help, but I''m not sure where to start. Any advice would be appreciated!'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Prostate Health: What Men Need to Know'),
        'I''m interested in learning more about prostate health and what men need to know about it. Are there any preventative measures or lifestyle changes that can help maintain good prostate health?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Urinary Track Infections in Women'),
        'I''m concerned about urinary tract infections (UTIs) in women. Can you provide information on their causes, symptoms, and ways to prevent them?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Incontinence Management for Seniors'),
        'I''m a caregiver for an elderly family member who is experiencing incontinence issues. I need guidance on how to effectively manage incontinence for seniors. Any tips or advice would be appreciated.'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Bladder Cancer Awareness'),
        'I want to raise awareness about bladder cancer. Can you provide information on its risk factors, symptoms, and available treatments?'
    );

-- Psychiatry
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Understanding Depression and Its Treatment'),
        'I''ve been feeling really down lately and suspect I might be dealing with depression. Can you provide information on what depression is, its common signs, and possible treatment options?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Anxiety Disorders: Signs and Coping Strategies'),
        'I''ve been experiencing excessive anxiety and it''s affecting my daily life. Can you share information about anxiety disorders, their signs, and effective coping strategies?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Mental Health Stigma: Breaking the Silence'),
        'I''m passionate about reducing the stigma surrounding mental health. Can you provide resources and tips on how to break the silence and promote mental health awareness?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Counseling and Therapy Options'),
        'I''m considering seeking counseling or therapy, but I''m not sure which options are available. Can you explain the different types of counseling and therapy and how to choose the right one for my needs?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Medications for Mental Health Conditions'),
        'I''ve heard that medications can be helpful for managing certain mental health conditions. Can you provide information on the types of medications used and their potential benefits and side effects?'
    );

-- Rheumatology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Living with Rheumatoid Arthritis'),
        'I''ve been recently diagnosed with rheumatoid arthritis, and I''m looking for advice on how to live with this condition. Can you provide information on managing symptoms and maintaining a good quality of life?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Osteoarthritis: Causes and Management'),
        'I suspect I might have osteoarthritis, and I''d like to learn more about the causes and how to manage it. Can you provide information on osteoarthritis, its causes, and effective management strategies?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Lupus: Symptoms and Treatment'),
        'My friend has lupus, and I''d like to understand more about it to support them. Can you explain the symptoms of lupus and the available treatment options for this condition?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Fibromyalgia: Coping with Chronic Pain'),
        'I''ve been diagnosed with fibromyalgia and I''m struggling with chronic pain. Can you provide guidance on coping strategies for fibromyalgia and managing the associated pain?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Spondyloarthritis and Its Impact'),
        'I''m interested in learning more about spondyloarthritis and its impact on people''s lives. Can you provide information on this condition and how it affects those who have it?'
    );

-- Endocrinology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Thyroid Disorders: Diagnosis and Treatment'),
        'I suspect I might have a thyroid disorder, and I''m looking for information on how it''s diagnosed and treated. Can you provide insights into thyroid disorders and their diagnosis and treatment options?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Diabetes Management and Lifestyle'),
        'I''ve recently been diagnosed with diabetes and want to learn more about managing it through lifestyle changes. Can you provide guidance on diabetes management and how to adapt my lifestyle to this condition?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Hormone Replacement Therapy for Menopause'),
        'I''m going through menopause and considering hormone replacement therapy. Can you explain what hormone replacement therapy is, its benefits, and potential risks associated with it during menopause?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Adrenal Gland Disorders'),
        'I''ve been experiencing symptoms that might be related to adrenal gland disorders. Can you provide information on the various adrenal gland disorders and their management?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Pituitary Disorders: What You Should Know'),
        'I''d like to learn more about pituitary disorders and their impact on health. Can you provide information on pituitary disorders and what people should know about them?'
    );

-- Pulmonology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Asthma: Symptoms and Inhaler Use'),
        'I''ve been recently diagnosed with asthma, and I''m looking for information on its symptoms and how to use inhalers effectively. Can you provide insights into asthma symptoms and the proper use of inhalers?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'COPD: Causes and Breathing Exercises'),
        'I have a family member with COPD, and I want to understand the causes and ways to improve their breathing. Can you explain the causes of COPD and provide information on effective breathing exercises for COPD patients?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Lung Cancer Screening and Prevention'),
        'I''m concerned about lung cancer and would like to know more about screening and prevention measures. Can you provide information on lung cancer screening and effective ways to prevent this disease?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Sleep Apnea: Diagnosis and CPAP Therapy'),
        'I suspect I might have sleep apnea, and I''m looking for information on diagnosis and CPAP therapy. Can you explain how sleep apnea is diagnosed and the use of CPAP therapy to manage it?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Managing Allergies and Respiratory Conditions'),
        'I suffer from allergies and respiratory conditions that worsen during certain seasons. Can you provide guidance on managing allergies and these respiratory conditions, especially during peak allergy seasons?'
    );

-- Nephrology
SELECT
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Kidney Function and Your Health'),
        'I''m interested in learning more about kidney function and how it impacts overall health. Can you provide information on the role of kidneys in health and wellness?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Chronic Kidney Disease: Stages and Management'),
        'My family member has been diagnosed with chronic kidney disease, and I want to understand the different stages and how it can be managed. Can you explain the stages of chronic kidney disease and their management options?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Hemodialysis vs. Peritoneal Dialysis'),
        'I''m looking for information on the key differences between hemodialysis and peritoneal dialysis. Can you provide a comparison of these two types of dialysis and their respective benefits and considerations?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Transplantation: Kidney Donor and Recipient Information'),
        'I''m interested in kidney transplantation and would like to know more about the process, both from the donor and recipient perspectives. Can you provide information for both kidney donors and recipients, including the transplantation process and considerations?'
    ),
    create_question_content(
        (SELECT ID FROM QUESTION WHERE TITLE = 'Hydration and Kidney Health'),
        'I''ve heard that proper hydration is important for kidney health. Can you provide guidance on how staying hydrated is essential for kidney health and tips on maintaining adequate hydration levels?'
    );
