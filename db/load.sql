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
INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Cardiology
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Orthopedics
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Dermatology
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Gastroenterology
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Neurology
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Ophthalmology
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Obstetrics
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Oncology
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Pediatrics
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Urology
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Psychiatry
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Rheumatology
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Endocrinology
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Pulmonology
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

INSERT INTO QUESTION (TITLE, AUTHOR, DATE) VALUES
    -- Nephrology
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
