<?php

namespace App\Repository;

use App\Entity\Transactions;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Validator\Constraints\DateTime;

/**
 * @extends ServiceEntityRepository<Transactions>
 *
 * @method Transactions|null find($id, $lockMode = null, $lockVersion = null)
 * @method Transactions|null findOneBy(array $criteria, array $orderBy = null)
 * @method Transactions[]    findAll()
 * @method Transactions[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TransactionsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Transactions::class);
    }

    public function save(Transactions $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Transactions $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function sortTransactions(string $date_start, string $date_finish, string $sname): array
    {
        $entityManager = $this->getEntityManager();
        if($sname != "allserv") {
            $query = $entityManager->createQuery(
                'SELECT p
            FROM App\Entity\Transactions p
            WHERE p.transdate >= :date_start AND p.transdate <= :date_finish AND p.service = :sname'
            );
            $query->setParameters(array(
                'date_start' => $date_start,
                'date_finish' => $date_finish,
                 'sname' => $sname,));
        }
        else {
            $query = $entityManager->createQuery(
                'SELECT p
            FROM App\Entity\Transactions p
            WHERE p.transdate >= :date_start AND p.transdate <= :date_finish'
            );
            $query->setParameters(array(
                'date_start' => $date_start,
                'date_finish' => $date_finish,));
        }

        return $query->getResult();
    }

//    /**
//     * @return Transactions[] Returns an array of Transactions objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('t')
//            ->andWhere('t.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('t.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Transactions
//    {
//        return $this->createQueryBuilder('t')
//            ->andWhere('t.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
